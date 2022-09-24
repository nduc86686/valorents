import 'package:equatable/equatable.dart';

import 'entities.dart';



class ShopData extends Equatable {
  dynamic cost;
  String? category;
  String? categoryText;
  GridPosition? gridPosition;
  bool? canBeTrashed;
  Null image;
  String? newImage;
  Null newImage2;
  String? assetPath;

  ShopData(
      {this.cost,
        this.category,
        this.categoryText,
        this.gridPosition,
        this.canBeTrashed,
        this.image,
        this.newImage,
        this.newImage2,
        this.assetPath});

  @override
  // TODO: implement props
  List<Object?> get props => [
    cost,
    category,
    categoryText,
    gridPosition,
    canBeTrashed,
    image,
    newImage,
    newImage2,
    assetPath
  ];
}