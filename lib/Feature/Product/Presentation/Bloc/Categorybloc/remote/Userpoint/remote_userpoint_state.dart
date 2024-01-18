

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../../Domain/Entity/Userpoint/UserpointEntity.dart';

abstract class RemoteUserpointState extends Equatable
{
  List<UserpointEntity> ? userpoint;
  late DioException ? error;
  RemoteUserpointState({this.userpoint,this.error});
}
class RemoteUserpointloading extends RemoteUserpointState
{
  RemoteUserpointloading();

  @override
  // TODO: implement props
  List<Object?> get props  =>[];
}
class RemoteUserpointDone extends RemoteUserpointState
{
  RemoteUserpointDone(List<UserpointEntity> data):super(userpoint: data);

  @override
  // TODO: implement props
  List<Object?> get props => [userpoint!];
}
class RemoteUserpointError extends RemoteUserpointState
{
  RemoteUserpointError(DioException error):super(error: error);

  @override
  // TODO: implement props
  List<Object?> get props => [error!];

}