
import 'package:equatable/equatable.dart';

class loginEntity extends Equatable
{
  String ? Email;
  String ? Password;
  String ? tokken;
  loginEntity({
   this.Email,
   this.Password,
    this.tokken
});
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      Email,
      Password,
      tokken
    ];
  }

}