import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
    required this.category,
    required this.isActive,
    required this.onPress,
  }) : super(key: key);

  final String category;
  final bool isActive;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding*0.1),
        decoration: BoxDecoration(
          color: isActive ? ResColor.primary : Colors.transparent,
          border: Border.all(
              color: isActive
                  ? Colors.transparent
                  : Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
      ),
    );
  }
}
