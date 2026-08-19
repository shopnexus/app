/// Paths for the hand-written retrofit service that has not been migrated yet.
/// `lib/api/generated` is the source of truth for every route: nothing here is
/// checked against the contract, so a constant that outlives its last caller is a
/// lie waiting to be copied — 145 unreferenced ones were deleted over three waves.
class ApiEndpoints {
  static const String baseUrl = 'https://shopnexus.hopto.org/api/v1/';

  /// The one per-account event stream (asyncapi `userStream`). Authorised by a
  /// single-use ticket from `POST /ws/tickets`, never by a token in the URL.
  static const String webSocketUrl = 'wss://shopnexus.hopto.org/api/v1/ws';

  // --- Auth ---
  /// Takes no bearer: `AuthInterceptor` calls it on a bare Dio.
  static const String refreshToken = 'token/refresh';

  // --- Account ---
  /// `Me` and `PublicAccount` are the last hand-written response models, which is
  /// the only reason these paths are still spelled out here.
  static const String me = 'me';
  static const String meProfile = 'me/profile';
  static const String accountDetailTemplate = 'accounts/{id}';

  // --- Wishlist ---
  static const String favoriteListingTemplate = 'favorites/{listingID}';

  // --- Interactions ---
  static const String listingsInteractions = 'listings/interactions';
}
