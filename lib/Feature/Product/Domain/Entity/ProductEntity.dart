import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable
{
  final int ? id;
  final Object ? informationid;
  final int ? categoryid;
  final String ? name;
  final String ? insurance;
  final double ? price;
  final String ? color;
  final String ? mainpictureUrlID;
  final List<dynamic> ? pictures;
  final String ? nameforushghah;
   ProductEntity({
     required  this.id,
     required this.informationid,
     required this.categoryid,
     required this.name,
     required this.insurance,
     required this.price,
     required this.color,
     required this.mainpictureUrlID,
     required this.pictures,
     required this.nameforushghah
});

  @override
  // TODO: implement props
  List<Object?> get props{
    return [
      id,
      informationid,
      name,
      insurance,
      price,
      color,
      mainpictureUrlID,
      pictures,
      nameforushghah
    ];
  }
}