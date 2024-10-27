import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/dimens.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/core/styles/text_styles.dart';
import 'package:flutter_fakestoreapi/presentation/components/box_shimmer.dart';
import 'package:flutter_fakestoreapi/presentation/components/network_image_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String url;
  final VoidCallback onPressed;
  final String title;
  final double price;
  final double rate;
  final int raterCount;

  const ProductCard(
      {Key? key,
      required this.url,
      required this.onPressed,
      required this.title,
      required this.price,
      required this.rate,
      required this.raterCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageLoader(
              url: url,
              radius: defaultBorderRadius,
              height: 0.4.sw,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyles.h5.copyWith(
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 0.25),
                    Text(
                      'USD $price',
                      style: TextStyles.h5,
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent.shade400,
                          size: 20,
                        ),
                        Text(
                          '$rate',
                          style: TextStyles.h7.copyWith(
                              color: ResColor.textSecondary
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '$raterCount Reviews',
                          style: TextStyles.h7.copyWith(
                            color: ResColor.textSecondary
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding*0.5, vertical: defaultPadding*0.25 ),
      surfaceTintColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxShimmer(
            height: 0.4.sw,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all( defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const BoxShimmer(height: 18, width: double.infinity),
                const SizedBox(
                  height: 4,
                ),
                BoxShimmer(height: 18, width: 0.2.sw),
                const SizedBox(height: defaultPadding ),
                BoxShimmer(height: 16, width: 0.4.sw),
                const SizedBox(height: defaultPadding * 0.5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BoxShimmer(
                      height: 14,
                      width: 14,
                      radius: 100,
                    ),
                    const SizedBox(width: 4),
                    const BoxShimmer(height: 14, width: 20),
                    const SizedBox(width: 8),
                    BoxShimmer(height: 14, width: 0.2.sw),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
