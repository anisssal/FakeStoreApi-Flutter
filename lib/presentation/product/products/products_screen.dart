import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/bloc/products_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/components.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/product_welcome_text.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/components/search_input.dart';
import 'package:flutter_fakestoreapi/routing/app_route.dart';
import 'package:go_router/go_router.dart';

import '../../components/cart_icon_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen._({Key? key}) : super(key: key);

  static route() {
    return BlocProvider(
      create: (context) => diContainer<ProductsBloc>()
        ..add(const ProductsEvent.fetch()),
      child: const ProductScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.account_circle, size: 30 ,color: ResColor.primary,),
          onSelected: (value) {
            if (value == 'logout') {
              context.read<AuthBloc>().add(const AuthEvent.logOut());
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'logout',
              child: Text('Logout'),
            ),
          ],
        ),
        title: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
          height: kToolbarHeight - 20,
        ),

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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ProductsBloc>().add(const ProductsEvent.fetch());
          },
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: ProductWelcomeText()),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding * 0.75),
                child: SearchInput(
                  hint: 'Search product',
                  onChanged: (value) {
                    context
                        .read<ProductsBloc>()
                        .add(ProductsEvent.searchByKeyword(value));
                  },
                  onClearIconClick: () {
                    context
                        .read<ProductsBloc>()
                        .add(const ProductsEvent.searchByKeyword(''));
                  },
                ),
              )),
              const SliverToBoxAdapter(child: ProductCategories()),
              const ProductList(),
              const SliverPadding(
                  padding: EdgeInsets.only(bottom: defaultPadding))
            ],
          ),
        ),
      ),
    );
  }
}
