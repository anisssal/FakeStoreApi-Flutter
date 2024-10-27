import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fakestoreapi/presentation/components/error_fetch_data_widget.dart';

void main() {
  testWidgets('ErrorFetchDataWidget displays default message', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: ErrorFetchDataWidget(),
          ),
        ),
      ),
    );

    expect(find.text('Something went wrong!'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('ErrorFetchDataWidget displays custom message', (WidgetTester tester) async {
    const customMessage = 'Unable to fetch data';

    await tester.pumpWidget(
      const ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: ErrorFetchDataWidget(msg: customMessage),
          ),
        ),
      ),
    );

    expect(find.text('Something went wrong!'), findsOneWidget);
    expect(find.text(customMessage), findsOneWidget);
  });

  testWidgets('ErrorFetchDataWidget displays the error image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: ErrorFetchDataWidget(),
          ),
        ),
      ),
    );

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    expect((imageWidget.image as AssetImage).assetName, 'assets/images/error.png');
  });
}
