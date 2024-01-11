

import 'dart:ffi';

import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';

class ProductModel extends ProductEntity
{
   ProductModel({
     int ? id,
     Object ? informationid,
     int ?  categoryid,
     String ? name,
     String ? insurance,
     double ? price,
     String ? color,
     String ? mainpictureUrlID,
     List<dynamic> ? pictures,
     String ? nameforushghah
}) : super(id: id, informationid: informationid, categoryid: categoryid, name: name, insurance:insurance, price: price, color: color, mainpictureUrlID: mainpictureUrlID, pictures: pictures, nameforushghah: nameforushghah);
  factory ProductModel.fromJson(Map< String,dynamic > map)
  {
    return ProductModel(
      id: map['id'] ?? "",
      informationid: map['informationid'],
      categoryid: map['categoryid'],
      name: map['name'],
      insurance: map['insurance'] ,
      price: map['price'].toDouble() ,
      color: map['color'] ,
      mainpictureUrlID: map['mainpictureUrlID'] ,
      pictures:map['pictures'] ,
      nameforushghah: map['nameforushghah']
    );
  }
}