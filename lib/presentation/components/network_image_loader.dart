import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/presentation/components/box_shimmer.dart';

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader({
    super.key,
    required this.url,
    this.placeholder,
    this.imageBuilder,
    this.errorWidget,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.radius = 0,
    this.errorIconSize = 35,
  });

  final String url;
  final PlaceholderWidgetBuilder? placeholder;
  final ImageWidgetBuilder? imageBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double radius;
  final double errorIconSize;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.grey.shade300,
          ),
          child: Icon(Icons.broken_image_outlined, size: errorIconSize));
    }
    return CachedNetworkImage(
        imageUrl: url,
        placeholder: placeholder ??
            (context, url) => BoxShimmer(
                  height: height,
                  width: width,
                  radius: radius,
                ),
        imageBuilder: imageBuilder ??
            (context, provider) => SizedBox(
                  height: height,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: Image(
                      image: provider,
                      fit: fit,
                      width: width,
                      height: height,
                    ),
                  ),
                ),
        errorWidget: errorWidget ??
            (context, url, error) => Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.grey.shade300,
                ),
                child: const Icon(
                  Icons.broken_image_outlined,
                )));
  }
}
