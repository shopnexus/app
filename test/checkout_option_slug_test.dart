import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/providers/checkout_provider.dart';

/// `transport_option` and `payment_option` are registry slugs, not the labels a
/// screen shows. The old state defaulted to `'Standard'`/`'Stripe'` and matched
/// `'standard'` against neither the slug `standard-delivery` nor the name
/// `Standard delivery`, so it silently fell through to `options.first`: the fee
/// on screen was right by accident while the value sent was a 422.
void main() {
  // Captured from POST /shipping-quotes on the dev backend. The enabled carrier
  // registry holds exactly this one row.
  const quotesJson = {
    'options': [
      {
        'option': 'standard-delivery',
        'name': 'Standard delivery',
        'fee': 15000,
      },
    ],
    'currency': 'VND',
    'contact_id': 'ctc_ben6dg1c315mz',
  };

  final quotes = ShippingQuotes.fromJson(Map<String, dynamic>.from(quotesJson));

  group('the carrier comes from the quote, never from a label', () {
    test('no transport option is chosen before a quote arrives', () {
      expect(const CheckoutState().transportOption, isNull);
      expect(const CheckoutState().shippingFee, 0);
    });

    test('quoting selects the returned slug and its fee', () {
      final state = const CheckoutState().withQuotes(quotes);

      expect(state.transportOption, 'standard-delivery');
      expect(state.shippingFee, 15000);
    });

    test('a slug already chosen survives a requote that still offers it', () {
      final state = const CheckoutState().withQuotes(quotes).withQuotes(quotes);

      expect(state.transportOption, 'standard-delivery');
    });

    test('the fee is the quoted fee for the chosen slug', () {
      final twoOptions = ShippingQuotes.fromJson(
        Map<String, dynamic>.from({
          ...quotesJson,
          'options': [
            ...quotesJson['options'] as List,
            {'option': 'express-delivery', 'name': 'Express', 'fee': 42000},
          ],
        }),
      );
      final state = const CheckoutState()
          .withQuotes(twoOptions)
          .copyWith(transportOption: 'express-delivery');

      expect(state.shippingFee, 42000);
    });
  });

  // Captured from GET /options?category=payment on the dev backend, trimmed to two rows.
  // The slug used to be a constant in the notifier, which is why this file exists: the row it
  // named was retired and every checkout answered 422 with nothing on screen to say why.
  final rails = OptionList.fromJson(
    Map<String, dynamic>.from({
      // A user-facing read blanks `provider` and nulls the two staff fields, and
      // `providers` — what an admin may switch a row to — is empty for the same reason.
      'options': [
        {
          'id': 'mock-success',
          'name': 'Mock: pay now (succeeds)',
          'description': 'Settles immediately, no redirect and no webhook.',
          'provider': '',
          'is_enabled': null,
          'priority': null,
        },
        {
          'id': 'mock-decline',
          'name': 'Mock: pay now (declined)',
          'description': 'Refused immediately.',
          'provider': '',
          'is_enabled': null,
          'priority': null,
        },
      ],
      'providers': <String>[],
    }),
  ).options.toList();

  group('the payment rail comes from the registry, never from a constant', () {
    test('nothing is chosen before the registry has answered', () {
      expect(const CheckoutState().paymentOption, isNull);
      expect(const CheckoutState().paymentOptions, isEmpty);
    });

    test('the first row is the default, so the common case is one tap', () {
      final state = const CheckoutState().withPaymentOptions(rails);

      expect(state.paymentOption, 'mock-success');
      expect(state.paymentOptions, hasLength(2));
    });

    test('a chosen rail survives a reload that still offers it', () {
      final state = const CheckoutState()
          .withPaymentOptions(rails)
          .copyWith(paymentOption: 'mock-decline')
          .withPaymentOptions(rails);

      expect(state.paymentOption, 'mock-decline');
    });

    test(
      'a rail that is no longer offered falls back instead of being sent',
      () {
        final state = const CheckoutState()
            .withPaymentOptions(rails)
            .copyWith(paymentOption: 'platform-checkout')
            .withPaymentOptions(rails);

        expect(state.paymentOption, 'mock-success');
      },
    );

    test('an empty registry chooses nothing, which the refusal reads', () {
      final state = const CheckoutState().withPaymentOptions(const <Option>[]);

      expect(state.paymentOption, isNull);
    });
  });
}
