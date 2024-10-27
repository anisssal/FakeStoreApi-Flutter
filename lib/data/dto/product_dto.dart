import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';

class ProductDTO extends Equatable {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  ProductRatingDTO? rating;

  ProductDTO({this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating});

  ProductDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? ProductRatingDTO.fromJson(json['rating']) : null;
  }

  ProductEntity toEntity() {
    return ProductEntity(id: id ?? 0,
        title: title ?? '',
        price: price?.toDouble() ?? 0.0,
        description: description ?? '',
        category: category ?? '',
        image: image ?? '',
        rate: rating?.rate?.toDouble() ?? 0.0,
        raterCount: rating?.count ?? 0);
  }

  @override
  List<Object?> get props => [id,
    title,
    price,
    description,
    category,
    image,
    rating];

}

class ProductRatingDTO extends Equatable{
  num? rate;
  int? count;

  ProductRatingDTO({this.rate, this.count});

  ProductRatingDTO.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  @override
  List<Object?> get props => [rate, count];

}