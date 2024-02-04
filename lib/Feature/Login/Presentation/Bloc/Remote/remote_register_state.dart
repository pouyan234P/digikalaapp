
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class remoteRegisterState extends Equatable
{
  late DioException ? error;
  remoteRegisterState({this.error});
}
class remoteRegisterLoading extends remoteRegisterState
{
  remoteRegisterLoading();
  @override
  List<Object> get props =>[];
}
class remoteRegisterDone extends remoteRegisterState
{
  remoteRegisterDone();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class remoteRegisterError extends remoteRegisterState
{
  remoteRegisterError(DioException error):super(error: error);
  @override
  // TODO: implement props
  List<Object> get props =>[error!];

}