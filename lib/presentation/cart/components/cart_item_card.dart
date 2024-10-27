import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/presentation/cart/components/qty_input.dart';
import 'package:flutter_fakestoreapi/presentation/components/network_image_loader.dart';

class CartItemCard extends StatelessWidget {
  final String title;
  final double price;
  final int count;
  final String imgUrl;
  final VoidCallback onPressed;
  final VoidCallback onDeletePress;
  final ValueChanged<int> onAmountChange ;
  const CartItemCard({
    Key? key,
    required this.title,
    required this.price,
    required this.count,
    required this.imgUrl,
    required this.onPressed,
    required this.onDeletePress, required this.onAmountChange,
  }) : super(key: key);

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NetworkImageLoader(
              url: imgUrl,
              radius: defaultBorderRadius,
              height: 0.35.sw,
              width: 0.25.sw,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStylesLp.h5
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: defaultPadding * 0.25),
                    Text(
                      'USD $price',
                      style:
                      TextStylesLp.h5.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QtyInput(
                          initialValue: count,
                          minimumValue: 1,
                          onDecreaseClick: (value) {
                            onAmountChange.call(value);
                          },
                          onValueChanged: (value) {
                            onAmountChange.call(value);
                          },
                          onIncreasedClick: (value) {
                            onAmountChange.call(value);
                          },

                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: ResColor.whiteColor5,
                          ),
                          onPressed: onDeletePress,
                        )
                      ],
                    )
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
