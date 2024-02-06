
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../Domain/Entity/loginEntity.dart';

abstract class remoteLoginState extends Equatable
{
  late DioException ? error;
  late String ? mylogin;
  remoteLoginState({this.error,this.mylogin});
}
class remoteLoginLoading extends remoteLoginState
{
  remoteLoginLoading();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class remoteLoginDone extends remoteLoginState
{
  remoteLoginDone(String data):super(mylogin: data);
  @override
  // TODO: implement props
  List<Object?> get props => [mylogin!];
}
class remoteLoginError extends remoteLoginState
{
  remoteLoginError(DioException error):super(error: error);
  @override
  // TODO: implement props
  List<Object?> get props => [error!];

}