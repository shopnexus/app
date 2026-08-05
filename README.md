# 🛍️ E-Commerce Flutter App

## 📖 Project Overview
This project is the Frontend mobile application for a comprehensive E-commerce platform. It is built using **Flutter** and integrates with a custom Backend RESTful API.

The primary focus of this repository is to demonstrate a scalable, maintainable, and modern mobile frontend architecture tailored for a seamless shopping experience.

## 🛠️ Tech Stack & Core Technologies
This project strictly follows a specific set of tools and libraries to maintain consistency:
* **Framework:** Flutter / Dart
* **Architecture:** Feature-first Layering (Data & Presentation layers)
* **State Management & Dependency Injection:** [Riverpod](https://riverpod.dev/) (using Code Generation)
* **Network / API Client:** [Dio](https://pub.dev/packages/dio) + a REST client **generated from the backend's OpenAPI document** (see *Generated API client* below)
* **Local Storage / Caching:** [Hive](https://pub.dev/packages/hive) (NoSQL)
* **Routing:** [go_router](https://pub.dev/packages/go_router)
* **JSON Serialization:** [Freezed](https://pub.dev/packages/freezed) + json_serializable
* **Core Libraries:** `intl` (money conversion & localization), `cached_network_image` (media cache), `image_picker` (image evidence upload), `fl_chart` (dashboard statistics), `web_socket_channel` (real-time chat), `shimmer` (skeleton screens).

## 🏗️ Architecture & Folder Structure
The app uses a **Feature-Driven Architecture** combined with a simplified Clean Architecture approach (excluding the Domain layer to optimize for UI/UX focus and rapid development).

Each feature is entirely self-contained and divided into `data` and `presentation` layers.

```text
lib/
├── core/                       # App-wide shared configurations & constants
│   ├── constants/              # API endpoints, App configurations
│   ├── network/                # Dio client setup, Interceptors
│   ├── realtime/               # The one per-account WebSocket and its event types
│   ├── routing/                # go_router configurations & route guards
│   ├── storage/                # Hive initialization & local DB keys
│   ├── theme/                  # Colors, Typography, Material 3 configurations
│   └── utils/                  # Helper functions, extensions, MoneyUtils
├── api/                        # The REST client, generated — do not hand-edit
│   ├── generated/              # openapi-generator output (tracked in git)
│   └── api_providers.dart      # the endpoint groups, built on the app's own Dio
├── shared/                     # Shared UI components & models used across features
│   ├── widgets/                # CustomButton, CustomTextField, ProductCard
│   └── models/                 # ResourceModel, RatingModel
├── features/                   # Self-contained feature modules
│   ├── auth/                   # Registration, login, forgot password
│   ├── catalog/                # Search, categories browse, recommended products, details
│   ├── cart/                   # Local cart state management with Hive sync
│   ├── checkout/               # Multi-step checkout, quote transport & payment polling
│   ├── account/                # Profile, addresses, wishlist, notifications, order history
│   ├── seller/                 # Seller dashboard stats, charts, listing CRUD, AI-assisted posting
│   ├── refund/                 # The refund state machine with evidence
│   ├── ticket/                 # Reports, refund disputes, order issues, support requests
│   ├── help_center/            # FAQs plus the user's own tickets
│   └── chat/                   # Real-time buyer-seller communication over the account socket
└── main.dart                   # Entry point, ProviderScope, initialization
```

## 🧠 Core Development Rules for Agents & Contributors
When generating code or adding features to this repository, strictly adhere to these rules:

* **State Management:** Always use **Riverpod** with `@riverpod` annotations (code generation). Do not use `StatefulWidget` for complex logic. Access providers via `ConsumerWidget` or `ConsumerStatefulWidget`.
* **API Communication:** Never hand-write an endpoint. The whole REST surface is generated from the backend's OpenAPI document into `lib/api/generated`; call it through the riverpod providers in `lib/api/api_providers.dart`, which build each endpoint group on the app's own `dioProvider` so the auth header, the 401 refresh and the error envelope still apply. Regenerate with `./tool/gen_api.sh` when the backend contract changes.
* **Data Models:** A shape the backend defines is the **generated** model — do not hand-write a freezed twin of it, because a drift between the two is a runtime 400 nobody sees until a user hits it. Reach for **Freezed** + `json_serializable` for what is genuinely the app's own: UI state, view models that compose several responses, and content shipped with the app.
* **Realtime:** One receive-only WebSocket per signed-in account (`lib/core/realtime`), authorised by a single-use ticket from `POST /ws/tickets`. There is no client-to-server message: the app changes state over REST and learns about other people's changes on the socket. Event codes live only in `RealtimeEventCode` — a hand-written string that drifts is an event the app silently stops reacting to. Delivery is at-most-once with no replay, so a screen open across a reconnect refetches.
* **Caching Strategy:** 
    * Use **Hive** exclusively.
    * **Do cache:** Auth tokens, user preferences (theme/language), search history, and a lightweight list of the last 10 viewed products.
    * **Do NOT cache:** The entire product catalog.
* **Routing:** Always use `context.go()` or `context.push()` via **go_router**. Define all routes in `core/routing/app_router.dart`.
* **Testing:** Focus purely on **Unit Testing** for critical business logic (e.g., Cart price calculations, API Model parsing). Do not generate UI/Widget tests unless explicitly requested.

## 🚀 Getting Started

### Prerequisites
* **Flutter SDK** (Latest stable version)
* **Dart SDK**

### Installation & Code Generation
Because this project relies heavily on code generation (Riverpod, Freezed, json_serializable), you must run `build_runner` after cloning or making changes to models/providers.

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run code generation (Crucial step):**
   ```bash
   # Run once:
   dart run build_runner build --delete-conflicting-outputs

   # Or run in watch mode during active development:
   dart run build_runner watch --delete-conflicting-outputs
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

## 🔌 Generated API client

`lib/api/generated` is the whole REST surface, generated from the backend's
OpenAPI document with the official [OpenAPI
Generator](https://openapi-generator.tech/)'s `dart-dio` generator. It is
**committed**, so a checkout builds without Java or `npx`, and a diff shows
exactly what a contract change did to the client.

Regenerate after the backend's spec changes:

```bash
./tool/gen_api.sh              # regenerate, then run build_runner
./tool/gen_api.sh --no-build   # regenerate only
SPEC=/path/to/openapi.yaml ./tool/gen_api.sh   # against a spec elsewhere
```

The script reads `../server/api/openapi.gen.yaml` and runs:

```bash
npx @openapitools/openapi-generator-cli generate \
  -i ../server/api/openapi.gen.yaml \
  -g dart-dio \
  -o lib/api/generated \
  --additional-properties=serializationLibrary=json_serializable,pubName=shopnexus_api \
  --schema-mappings SemanticSeed=String --type-mappings SemanticSeed=String
```

Two things it does afterwards, both for a reason:

* `dart-dio` emits a **standalone package**. The script flattens it into the app
  and rewrites the `package:shopnexus_api/...` self-imports, so there is one
  pubspec, one `build_runner` run and one Dio — a nested package would need its
  own resolve and its own codegen pass.
* `SemanticSeed` is `oneOf: [TagSlug, CategoryID]`, two strings the backend tells
  apart by shape. The generator emits a syntactically broken empty class for
  that, so it is mapped to the type it already is.

Using it:

* Call it through `lib/api/api_providers.dart` (`catalogApiProvider`,
  `orderApiProvider`, …). Never construct `ShopnexusApi` from the generated
  barrel — it builds its own Dio with none of this app's interceptors.
* Do not import the barrel `lib/api/generated/shopnexus_api.dart` either: it
  exports classes named `Error`, `Message` and `Resource`, which collide with
  `dart:core` and with the app's own models. Import the specific model file.
* Method names come from path + verb (`listingsGet`, `offersIdAcceptancePost`)
  because the spec has no `operationId`s. Single-object routes return a wrapper
  with one `.data` field; the generator dedupes structurally identical `{data: X}`
  envelopes, so a wrapper's name sometimes mentions an unrelated route.
* `lib/api/analysis_options.yaml` narrows the analyzer over the generated code:
  style lints do not apply to machine-written code, but a real error still has to
  surface in `flutter analyze`.
* `@CopyWith()` on the generated DTOs is deliberately not generated —
  `copy_with_extension_gen`'s analyzer pin collides with the other generators',
  and `copyWith` on 240 edge DTOs buys nothing. Only the annotation has to
  resolve, which is why `copy_with_extension` is a runtime dependency.

