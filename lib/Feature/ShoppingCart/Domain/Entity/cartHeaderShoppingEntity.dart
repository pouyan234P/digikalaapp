

import 'package:equatable/equatable.dart';

class cartHeaderShoppingEntity extends Equatable
{
  final int ? id ;
final int ? Userid;
final int ? digicouponId;
const cartHeaderShoppingEntity({
    this.id,
  this.Userid,
  this.digicouponId
});
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      Userid,
      digicouponId
    ];
  }

}