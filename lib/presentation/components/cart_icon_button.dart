import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/res_color.dart';

class CartIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final int cartCount ;
  const CartIconButton({Key? key, required this.onPressed, required this.cartCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Cart",
        onPressed: onPressed,
        icon: Badge(
          isLabelVisible: cartCount>0,
          label: Text('$cartCount'),
          offset: const Offset(8, 8),
          backgroundColor: ResColor.errorColor,
          child: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ));
  }
}
