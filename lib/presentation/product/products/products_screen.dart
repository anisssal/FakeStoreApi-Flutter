import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/bloc/products_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/components.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/product_card.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/product_categories.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/product_welcome_text.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/search_input.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen._({Key? key}) : super(key: key);

  static route() {
    return BlocProvider(
      create: (context) =>
          diContainer<ProductsBloc>()..add(const ProductsEvent.fetch()),
      child: const ProductScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
          height: kToolbarHeight - 20,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ProductsBloc>().add(const ProductsEvent.fetch());
          },
          child:  CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: ProductWelcomeText()),
              SliverToBoxAdapter(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding*0.75),
                child: SearchInput(hint: 'Search product',
                onChanged: (value){
                  context.read<ProductsBloc>().add(ProductsEvent.searchByKeyword(value));
                },
                onClearIconClick: (){
                  context.read<ProductsBloc>().add(const ProductsEvent.searchByKeyword(''));
                },),
              )),
              const SliverToBoxAdapter(child: ProductCategories()),
              const ProductList(),
              const SliverPadding(padding: EdgeInsets.only(bottom: defaultPadding))
            ],
          ),
        ),
      ),
    );
  }
}