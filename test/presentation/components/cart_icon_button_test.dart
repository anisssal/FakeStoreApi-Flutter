import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/presentation/components/cart_icon_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CartIconButton displays cart count when cartCount > 0', (WidgetTester tester) async {
    const int cartCount = 3;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartIconButton(
            onPressed: () {},
            cartCount: cartCount,
          ),
        ),
      ),
    );

    expect(find.text('$cartCount'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });

  testWidgets('CartIconButton hides cart count badge when cartCount is 0', (WidgetTester tester) async {
    const int cartCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartIconButton(
            onPressed: () {},
            cartCount: cartCount,
          ),
        ),
      ),
    );

    expect(find.text('$cartCount'), findsNothing);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });

  testWidgets('CartIconButton calls onPressed when tapped', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartIconButton(
            onPressed: () {
              pressed = true;
            },
            cartCount: 2,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);
  });
}
