import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/bloc/product_detail_cubit.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/bloc/product_detail_cubit.dart';
import 'package:toastification/toastification.dart';

class ProductDetailBottomBar extends StatelessWidget {
  const ProductDetailBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailCubit, ProductDetailState>(
      listener: (context, state) {
        if(state.status == ProductDetailCubitStatus.successAddToCart) {
          toastification.show(
            context: context,
            style: ToastificationStyle.flatColored,
            title: const Text('Success adding to cart!'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 2),
          );
        }

      },
      child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state.status != ProductDetailCubitStatus.successAddToCart &&
              state.status != ProductDetailCubitStatus.completed) {
            return Container();
          }
          return Material(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8 ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: const Offset(0, -7),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProductDetailCubit>().addProductToCart();
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                    ),
                    Text("Add to Cart")
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
