import 'package:flutter_test/flutter_test.dart';
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

  group('the payment option is the one enabled rail', () {
    test('it is the platform slug, not a gateway brand', () {
      expect(CheckoutNotifier.paymentOption, 'platform-checkout');
    });
  });
}
