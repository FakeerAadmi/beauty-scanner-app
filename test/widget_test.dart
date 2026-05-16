import 'package:beauty_scanner_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the home screen', (tester) async {
    await tester.pumpWidget(const BeautyScannerApp());

    expect(find.text('Skincare scanner'), findsOneWidget);
    expect(find.text('Scan Barcode'), findsOneWidget);
  });
}
