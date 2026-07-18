import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';

part 'currency_model.g.dart';

@freezed
abstract class ExchangeRatesResponse with _$ExchangeRatesResponse {
  const factory ExchangeRatesResponse({
    required String base,
    required Map<String, double> rates,
    @JsonKey(name: 'fetched_at') required String fetchedAt,
    required List<String> supported,
  }) = _ExchangeRatesResponse;

  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesResponseFromJson(json);
}
