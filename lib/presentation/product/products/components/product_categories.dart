import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/styles/dimens.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/presentation/components/box_shimmer.dart';
import 'package:flutter_fakestoreapi/presentation/components/error_fetch_data_widget.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/bloc/products_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/category_chip.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            "Categories",
            style: TextStyles.h5.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: defaultPadding*0.5,),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state.status == ProductBlocStatus.initial ||
                state.status == ProductBlocStatus.loading) {
              return const _CategoriesLoading();
            }
            if (state.status == ProductBlocStatus.failure) {
              return Container();
            }
            return _Categories(
              categories: state.originProducts.map((e) => e.category).toSet().toList(), categorySelected: state.category,
            );
          },
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  final List<String> categories;
  final String categorySelected ;
  const _Categories({Key? key, required this.categories, required this.categorySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: defaultPadding,),
          CategoryChip(
            category: "All Category",
            isActive: categorySelected.isEmpty,
            onPress: () {
              context
                  .read<ProductsBloc>()
                  .add(const ProductsEvent.filterByCategory(''));
            },
          ),
          ...categories.map((category) => CategoryChip(
                category: category,
                isActive: categorySelected == category,
                onPress: () {
                  context
                      .read<ProductsBloc>()
                      .add(ProductsEvent.filterByCategory(category));
                },
              )),
        ],
      ),
    );
  }
}

class _CategoriesLoading extends StatelessWidget {
  const _CategoriesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (_) => const Padding(
            padding: EdgeInsets.only(left: defaultPadding),
            child: BoxShimmer(
              height: 28,
              width: 96,
              radius: 20,
            ),
          ),
        ),
      ),
    );
  }
}
