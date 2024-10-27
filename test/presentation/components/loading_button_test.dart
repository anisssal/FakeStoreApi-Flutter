import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/presentation/components/loading_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoadingButton displays content when isLoading is false', (WidgetTester tester) async {
    const content = Text('Press Me');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingButton(
            onPressed: () {},
            isLoading: false,
            content: content,
          ),
        ),
      ),
    );

    expect(find.text('Press Me'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('LoadingButton displays loading indicator when isLoading is true', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingButton(
            onPressed: () {},
            isLoading: true,
            content: const Text('Press Me'),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Press Me'), findsNothing);
  });

  testWidgets('LoadingButton onPressed is called when tapped and isLoading is false', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingButton(
            onPressed: () {
              pressed = true;
            },
            isLoading: false,
            content: const Text('Press Me'),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);
  });

}
