

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/productShoppingEntity.dart';

class productShoppingModel extends productShoppingEntity
{
  productShoppingModel({
     int? id,
     int? productid,
     String ? Name ,
     double ? Price,
     String ? Picture,
     String ? Color,
     String? hashColor,
}):super(id: id,Color: Color,Price: Price,Name: Name,hashColor: hashColor,Picture: Picture,productid: productid);
  factory productShoppingModel.fromJson(Map< String,dynamic > map)
  {
    return productShoppingModel(
      id:map["id"] ?? "",
      productid: map["productid"],
      Name: map["name"],
      hashColor: map["hashColor"],
      Price: map["price"].toDouble(),
      Color: map["color"],
      Picture: map["picture"],
    );
  }
}