import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';

class ProductWelcomeText extends StatelessWidget {
  const ProductWelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding ,
          ),
          Text(
            "Hi,",
            style: TextStyles.h4,
          ),
          Text(
            "What are you looking for today?",
            style: TextStyles.h2,
          ),
        ],
      ),
    );
  }
}
