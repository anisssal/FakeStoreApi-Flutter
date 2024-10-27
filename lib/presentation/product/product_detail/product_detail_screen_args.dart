part of 'product_detail_screen.dart';
class ProductDetailScreenArgs extends Equatable {
  final int? id;
  final ProductEntity? productEntity;

  ProductDetailScreenArgs.withId({required this.id}) : productEntity = null;
  ProductDetailScreenArgs.withProduct({required this.productEntity}) : id = null;

  @override
  List<Object?> get props => [id, productEntity];
}