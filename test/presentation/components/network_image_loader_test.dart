import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fakestoreapi/presentation/components/box_shimmer.dart';
import 'package:flutter_fakestoreapi/presentation/components/network_image_loader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'network_image_loader_test.mocks.dart';

@GenerateMocks([DefaultCacheManager])
void main() {
  testWidgets('Displays error icon when URL is empty', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NetworkImageLoader(url: '', width: 100, height: 100),
      ),
    );

    expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
  });

  testWidgets('Shows placeholder while loading', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NetworkImageLoader(
          url: 'https://example.com/image.png',
          width: 100,
          height: 100,
        ),
      ),
    );

    expect(find.byType(BoxShimmer), findsOneWidget);
  });

  testWidgets('Displays image when loaded', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: NetworkImageLoader(
          url: 'https://example.com/image.png',
          width: 100,
          height: 100,
          imageBuilder: (context, imageProvider) => Image(image: imageProvider),
        ),
      ),
    );

    // Simulate CachedNetworkImage loading state
    await tester.runAsync(() async {
      await Future.delayed(const Duration(seconds: 1));
    });
    await tester.pump();

    expect(find.byType(Image), findsOneWidget);
  });

  // testWidgets('Shows error widget when image load fails', (WidgetTester tester) async {
  //   final mockCacheManager = MockDefaultCacheManager();
  //
  //   when(() => mockCacheManager.getImageFile('invalid_url')).thenThrow(Exception());
  //
  //
  //   await tester.pumpWidget(
  //     const MaterialApp(
  //       home: NetworkImageLoader(
  //         url: 'invalid_url',
  //         width: 100,
  //         height: 100,
  //       ),
  //     ),
  //   );
  //   await tester.pumpAndSettle();
  //
  //   // Simulate error in loading
  //   await tester.runAsync(() async {
  //     await Future.delayed(const Duration(seconds: 1));
  //   });
  //   await tester.pump();
  //
  //   expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
  // });
}