#!/usr/bin/env bash
#
# Regenerate the REST client from the backend's OpenAPI document.
#
#   ./tool/gen_api.sh          # regenerate, then run build_runner
#   ./tool/gen_api.sh --no-build
#
# The output is committed: a checkout builds without Java or npx, and a diff
# shows what the contract change actually did to the client.
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SPEC="${SPEC:-$APP_DIR/../server/api/openapi.gen.yaml}"
OUT="$APP_DIR/lib/api/generated"
PKG="shopnexus_flutter_app"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

[ -f "$SPEC" ] || { echo "spec not found: $SPEC" >&2; exit 1; }

# dart-dio keeps the dio stack the app already has, so the generated endpoints
# go through the app's own interceptors instead of a second HTTP client.
# SemanticSeed is `oneOf: [TagSlug, CategoryID]` — two strings the backend tells
# apart by shape. dart-dio emits a syntactically broken empty class for that, so
# it is mapped to the type it already is.
npx --yes @openapitools/openapi-generator-cli generate \
  -i "$SPEC" \
  -g dart-dio \
  -o "$TMP/pkg" \
  --additional-properties=serializationLibrary=json_serializable,pubName=shopnexus_api \
  --schema-mappings SemanticSeed=String \
  --type-mappings SemanticSeed=String

# The generator emits a standalone package. The app hosts the code directly
# instead, so there is one pubspec, one build_runner and one dio — a nested
# package would need its own resolve and its own codegen run.
rm -rf "$OUT"
mkdir -p "$OUT"
mv "$TMP/pkg/lib/src"/* "$OUT/"
mv "$TMP/pkg/lib/shopnexus_api.dart" "$OUT/shopnexus_api.dart"

# Rewrite the standalone package's self-imports onto this package.
grep -rl 'package:shopnexus_api/' "$OUT" \
  | xargs sed -i \
      -e "s#package:shopnexus_api/src/#package:$PKG/api/generated/#g" \
      -e "s#package:shopnexus_api/shopnexus_api.dart#package:$PKG/api/generated/shopnexus_api.dart#g"

echo "generated $(find "$OUT" -name '*.dart' | wc -l) files into lib/api/generated"

if [ "${1:-}" != "--no-build" ]; then
  cd "$APP_DIR"
  dart run build_runner build --delete-conflicting-outputs
fi
