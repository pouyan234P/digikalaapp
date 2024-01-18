import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/PointofviewEntity.dart';
import 'package:equatable/equatable.dart';

class UserpointEntity extends Equatable
{
  final int ? id;
 final PointofviewEntity ? Pointofviewid ;
 final int ? Userid ;
 final ProductEntity ? Productid ;
  UserpointEntity({
    this.id,
    this.Pointofviewid,
    this.Userid,
    this.Productid
});
  @override
  // TODO: implement props
  List<Object?> get props {
   return[ id,
    Productid,
    Userid,
    Pointofviewid
    ];
  }

}