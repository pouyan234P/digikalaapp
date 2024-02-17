
import 'package:digikalaapp/Feature/Product/Data/Model/ProductModel.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/Userpoint/PointofviewModel.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';

class UserpointModel extends UserpointEntity
{
  PointofviewModel ? Pointofviewid;
  ProductModel ? Productid;
  int ? Userid;
  UserpointModel({
   int ? id,
    this.Pointofviewid,
   this.Userid,
   this.Productid
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
  Map<String, dynamic> toJson() => {
    'Pointofviewid': Pointofviewid?.toJson(),
    'Productid': Productid?.toJson(),
    'Userid': Userid ?? 0
  };
}