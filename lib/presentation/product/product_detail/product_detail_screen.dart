import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/components/cart_icon_button.dart';
import 'package:flutter_fakestoreapi/presentation/components/error_fetch_data_widget.dart';
import 'package:flutter_fakestoreapi/presentation/components/network_image_loader.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/bloc/product_detail_cubit.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/components/product_detail_bottom_bar.dart';
import 'package:flutter_fakestoreapi/routing/app_route.dart';
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return CartIconButton(
                onPressed: () {
                  GoRouter.of(context).push(RoutePath.cart);
                },
                cartCount: state.totalItemQtyCount,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const ProductDetailBottomBar(),
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
