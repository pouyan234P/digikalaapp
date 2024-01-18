
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';

class UserpointModel extends UserpointEntity
{
  UserpointModel({
    id,
    Pointofiviewid,
    Userid,
    Productid
}):super(id: id,Pointofiviewid: Pointofiviewid,Userid: Userid,Productid: Productid);
  factory UserpointModel.fromJson(Map< String,dynamic > map)
  {
    return UserpointModel(
      id: map["id"] ?? "",
      Pointofiviewid: map["pointofiviewid"] ?? "",
      Userid: map['userid'] ?? "",
      Productid: map['productid'] ?? "",
    );
  }
}