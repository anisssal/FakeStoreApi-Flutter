import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/category_chip.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryChip', () {
    testWidgets('renders CategoryChip with correct text and initial style', (WidgetTester tester) async {
      const testCategory = 'Electronics';
      const isActive = true;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: CategoryChip(
                category: testCategory,
                isActive: isActive,
                onPress: () {},
              ),
            ),
          ),
        ),
      );

      final textFinder = find.text(testCategory);
      final containerFinder = find.byType(Container);

      expect(textFinder, findsOneWidget);
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, equals(ResColor.primary));
    });

    testWidgets('renders with transparent background when inactive', (WidgetTester tester) async {
      const testCategory = 'Electronics';
      const isActive = false;

      await tester.pumpWidget(
        ScreenUtilInit(
          child: MaterialApp(
            home: Scaffold(
              body: CategoryChip(
                category: testCategory,
                isActive: isActive,
                onPress: () {},
              ),
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, equals(Colors.transparent));
    });

    testWidgets('triggers onPress callback when tapped', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        ScreenUtilInit(
          child: MaterialApp(
            home: Scaffold(
              body: CategoryChip(
                category: 'Electronics',
                isActive: true,
                onPress: () {
                  wasPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CategoryChip));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });
  });
}
