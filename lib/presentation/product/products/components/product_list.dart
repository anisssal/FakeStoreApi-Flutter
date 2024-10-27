import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/components/error_fetch_data_widget.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/product_detail_screen.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/bloc/products_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/product_card.dart';
import 'package:flutter_fakestoreapi/routing/app_route.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductBlocStatus.failure) {
          return const SliverToBoxAdapter(child: ErrorFetchDataWidget());
        }

        final gridChildCount = state.status == ProductBlocStatus.completed
            ? state.products.length
            : 2;

        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.65,
          ),
          delegate: SliverChildBuilderDelegate(
            (
              BuildContext context,
              int index,
            ) {
              if (state.status == ProductBlocStatus.initial ||
                  state.status == ProductBlocStatus.loading) {
                return const ProductCardLoading();
              }
              if (state.status == ProductBlocStatus.completed) {
                final product = state.products[index];
                return ProductCard(
                    title: product.title,
                    url: product.image,
                    price: product.price,
                    rate: product.rate,
                    raterCount: product.raterCount,
                    onPressed: () {
                      GoRouter.of(context).push(RoutePath.productDetail,
                          extra: ProductDetailScreenArgs.withProduct(
                              productEntity: product));
                    });
              }
              return null;
            },
            childCount: gridChildCount,
          ),
        );
      },
    );
  }
}
