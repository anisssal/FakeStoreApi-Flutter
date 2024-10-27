import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:shimmer/shimmer.dart';

class BoxShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final Widget? child;

  const BoxShimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 4.0,
  })  : child = null;

  const BoxShimmer.child({
    super.key,
    required this.child,
  })  : height = null,
        width = null,
        radius = 0;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[300]!,
      baseColor: Colors.grey.shade100,
      child: child ??
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey[300]!,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
    );
  }
}
