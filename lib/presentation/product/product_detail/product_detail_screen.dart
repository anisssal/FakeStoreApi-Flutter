import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/components/error_fetch_data_widget.dart';
import 'package:flutter_fakestoreapi/presentation/components/network_image_loader.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/bloc/product_detail_cubit.dart';
import 'package:go_router/go_router.dart';

part 'product_detail_screen_args.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen._({Key? key}) : super(key: key);

  static route(GoRouterState state) {
    final screenArgs = state.extra as ProductDetailScreenArgs;
    return BlocProvider(
      create: (context) => diContainer<ProductDetailCubit>()
        ..iniProductEntity(
            product: screenArgs.productEntity, id: screenArgs.id),
      child: const ProductDetailScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              return IconButton(
                  tooltip: "Cart",
                  onPressed: () {
                    //   go to cart page
                  },
                  icon: Badge(
                    isLabelVisible: true,
                    label: Text("${state.cartCount}"),
                    offset: const Offset(8, 8),
                    backgroundColor: ResColor.errorColor,
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ));
            },
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailCubit, ProductDetailState>(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              if (state.status == ProductDetailCubitStatus.loading || state.status == ProductDetailCubitStatus.initial) {
                return SizedBox(
                  height: 1.sw,
                  width: double.infinity,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: ResColor.primary,
                    ),
                  ),
                );
              }
              if (state.status == ProductDetailCubitStatus.failure) {
                return const ErrorFetchDataWidget();
              }

              final product = state.productEntity!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NetworkImageLoader(
                    url: product.image,
                    radius: defaultBorderRadius,
                    height: 0.8.sw,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'USD ${product.price}',
                          style: TextStyles.h5,
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Text(
                          product.title,
                          style:
                          TextStyles.h4.copyWith(overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(
                          height: defaultPadding * 0.75,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent.shade400,
                              size: 20,
                            ),
                            Text(
                              '${product.rate}',
                              style: TextStyles.h7
                                  .copyWith(color: ResColor.textSecondary),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${product.raterCount} Reviews',
                              style: TextStyles.h7
                                  .copyWith(color: ResColor.textSecondary),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding * 1.5,
                        ),
                        Text(
                          product.description,
                          style: TextStyles.h7,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
