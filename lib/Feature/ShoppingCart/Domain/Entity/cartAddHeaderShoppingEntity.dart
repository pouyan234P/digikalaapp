

import 'package:equatable/equatable.dart';

class cartAddHeaderShoppingEntity extends Equatable
{
  final int ? id ;
  final int ? Userid;
  final int ? digicouponId;
  const cartAddHeaderShoppingEntity({
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