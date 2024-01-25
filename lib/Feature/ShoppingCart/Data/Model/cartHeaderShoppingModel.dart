

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartHeaderShoppingEntity.dart';

class cartHeaderShoppingModel extends cartHeaderShoppingEntity
{
  cartHeaderShoppingModel({
     int ? id ,
     int ? Userid,
     int ? digicouponId,
}):super(id: id,Userid: Userid,digicouponId: digicouponId);
  factory cartHeaderShoppingModel.fromJson(Map< String,dynamic > map)
  {
    return cartHeaderShoppingModel(
      id: map["id"] ?? "",
      digicouponId: map["digicouponId"] ?? "",
      Userid: map["userid"] ?? ""
    );
  }
}