import 'package:flutter_test/flutter_test.dart';
import 'package:ikram_charity/main.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(const CharityApp());
    expect(find.byType(CharityApp), findsOneWidget);
  });
}
