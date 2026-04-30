import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App khởi động thành công smoke test', (WidgetTester tester) async {
    // Bọc app trong ProviderScope vì đang dùng Riverpod
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Kiểm tra xem app có render được không mà không bị crash
    expect(find.byType(MyApp), findsOneWidget);
  });
}