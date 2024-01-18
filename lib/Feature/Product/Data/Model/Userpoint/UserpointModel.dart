
import 'package:digikalaapp/Feature/Product/Data/Model/ProductModel.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/Userpoint/PointofviewModel.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';

class UserpointModel extends UserpointEntity
{
  UserpointModel({
   int ? id,
    PointofviewModel ? Pointofviewid,
   int ? Userid,
   ProductModel ? Productid,
}):super(id: id,Pointofviewid: Pointofviewid,Userid: Userid,Productid: Productid);
  factory UserpointModel.fromJson(Map< String,dynamic > map)
  {
    return UserpointModel(
      id: map["id"] ?? "",
      Pointofviewid: PointofviewModel.fromJson(map["pointofviewid"]),
      Userid: map['userid'] ?? "",
      Productid:ProductModel.fromJson(map['productid']),
    );
  }
}