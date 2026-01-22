import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_kandy_wear/main.dart'; // Make sure this is the correct path

void main() {
  testWidgets('Bottom navigation loads home page', (WidgetTester tester) async {
    // Build your app
    await tester.pumpWidget(KandyWearApp());

    // Expect to find welcome text on home page
    expect(find.text('Welcome to Kandy Wear - Where Tradition Meets Elegance!'), findsOneWidget);

    // Tap the 'Collection' icon in BottomNavigationBar
    await tester.tap(find.byIcon(Icons.collections));
    await tester.pumpAndSettle();

    // Expect to find one of the collection items
    expect(find.text('Silk Sarees'), findsOneWidget);
  });
}
