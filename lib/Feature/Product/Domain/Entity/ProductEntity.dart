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
       this.id,
      this.informationid,
      this.categoryid,
      this.name,
      this.insurance,
      this.price,
      this.color,
      this.mainpictureUrlID,
      this.pictures,
      this.nameforushghah
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