import 'package:flutter_test/flutter_test.dart';
import 'package:tgv_company/main.dart';

void main() {
  testWidgets('TGV app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const TGVApp());
    expect(find.text('TGV'), findsWidgets);
  });
}
