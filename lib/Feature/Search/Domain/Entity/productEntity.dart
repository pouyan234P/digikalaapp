

import 'package:equatable/equatable.dart';

class searchProductEntity extends Equatable
{
  final int ? id;
  final String ? name;
  final String ? mainpictureUrlID;

  searchProductEntity({
    this.id,
    this.name,
    this.mainpictureUrlID,

  });

  @override
  // TODO: implement props
  List<Object?> get props{
    return [
      id,
      name,
      mainpictureUrlID,
    ];
  }
}