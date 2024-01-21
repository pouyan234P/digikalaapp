

import 'package:digikalaapp/Feature/Search/Domain/Entity/productEntity.dart';

class searchProductModel extends searchProductEntity
{
  searchProductModel({
     int ? id,
     String ? name,
     String ? mainpictureUrlID,
}):super(id: id,mainpictureUrlID: mainpictureUrlID,name: name);

  factory searchProductModel.fromJson(Map<String,dynamic> map)
  {
    return searchProductModel(
      name: map["name"] ?? "",
      mainpictureUrlID: map["mainpictureUrlID"] ?? "",
      id: map["id"] ?? ""
    );
  }
}