import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/presentation/cart/components/qty_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QtyInput Widget Tests', () {
    testWidgets('Initial value is displayed correctly', (WidgetTester tester) async {
      const initialValue = 5;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: QtyInput(initialValue: initialValue),
            ),
          ),
        ),
      );

      expect(find.text('$initialValue'), findsOneWidget);
    });

    testWidgets('Increase button increments value', (WidgetTester tester) async {
      const initialValue = 2;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: QtyInput(initialValue: initialValue),
            ),
          ),
        ),
      );

      final increaseButton = find.byIcon(Icons.add_circle_outline_outlined);
      await tester.tap(increaseButton);
      await tester.pumpAndSettle();

      expect(find.text('${initialValue + 1}'), findsOneWidget);
    });

    testWidgets('Decrease button decrements value', (WidgetTester tester) async {
      const initialValue = 2;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: QtyInput(initialValue: initialValue),
            ),
          ),
        ),
      );

      final decreaseButton = find.byIcon(Icons.remove_circle_outline_outlined);
      await tester.tap(decreaseButton);
      await tester.pumpAndSettle();

      expect(find.text('${initialValue - 1}'), findsOneWidget);
    });

    testWidgets('Decrease button is disabled when value equals minimumValue', (WidgetTester tester) async {
      const minimumValue = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: QtyInput(
                initialValue: minimumValue,
                minimumValue: minimumValue,
              ),
            ),
          ),
        ),
      );

      final decreaseButton = find.byIcon(Icons.remove_circle_outline_outlined);
      await tester.tap(decreaseButton);
      await tester.pumpAndSettle();

      expect(find.text('$minimumValue'), findsOneWidget); // Value should remain the same
    });

    testWidgets('Increase button is disabled when value equals maximumValue', (WidgetTester tester) async {
      const initialValue = 5;
      const maximumValue = 5;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: QtyInput(
                initialValue: initialValue,
                maximumValue: maximumValue,
              ),
            ),
          ),
        ),
      );

      final increaseButton = find.byIcon(Icons.add_circle_outline_outlined);
      await tester.tap(increaseButton);
      await tester.pumpAndSettle();

      expect(find.text('$maximumValue'), findsOneWidget); // Value should remain the same
    });

    testWidgets('onValueChanged callback is called with the updated value', (WidgetTester tester) async {
      int? updatedValue;
      const initialValue = 2;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            child: Scaffold(
              body: QtyInput(
                initialValue: initialValue,
                onValueChanged: (value) => updatedValue = value,
              ),
            ),
          ),
        ),
      );

      final increaseButton = find.byIcon(Icons.add_circle_outline_outlined);
      await tester.tap(increaseButton);
      await tester.pumpAndSettle();

      expect(updatedValue, initialValue + 1);
    });
  });
}
