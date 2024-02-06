

import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/cartHeaderShoppingModel.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/productShoppingModel.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';



class cartDetailShoppingModel extends cartDetailShoppingEntity
{
  cartDetailShoppingModel({
    int ? id ,
    cartHeaderShoppingModel ? Headerid,
    productShoppingModel ? productid,
    int ? Count,
  }):super(id: id,productid: productid,Headerid: Headerid,Count: Count);
  factory cartDetailShoppingModel.fromJson(Map< String,dynamic > map)
  {
    return cartDetailShoppingModel(
        Count: map["count"] ?? "",
        Headerid:cartHeaderShoppingModel.fromJson(map["headerid"]),
        productid:productShoppingModel.fromJson(map["productid"]),
        id: map["id"] ?? ""
    );
  }
}