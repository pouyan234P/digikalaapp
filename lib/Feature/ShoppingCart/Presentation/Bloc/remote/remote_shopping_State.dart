

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../Domain/Entity/cartDetailShoppingEntity.dart';

abstract class RemoteShoppingState extends Equatable
{
  late List<cartDetailShoppingEntity> ? listshoppingcart;
  late bool ? booldelete;
  late DioException ? error;
  RemoteShoppingState({this.listshoppingcart,this.error});
  RemoteShoppingState.delete({ this.booldelete,this.error});
}
class RemoteShoppingLoading extends RemoteShoppingState
{

  RemoteShoppingLoading();
  @override
  List<Object> get props =>[];
}
class RemoteShoppingInitial extends RemoteShoppingState {
  RemoteShoppingInitial();
  @override
  List<Object> get props =>[];
}
class RemoteShoppingDone extends RemoteShoppingState
{
  RemoteShoppingDone(List<cartDetailShoppingEntity> data):super(listshoppingcart: data);
  @override
  List<Object> get props =>[listshoppingcart!];
}
class RemoteShoppingError extends RemoteShoppingState
{
  RemoteShoppingError(DioException dioException):super(error: dioException);
  @override
  List<Object> get props =>[error!];
}
class RemoteAddShoppingLoading extends RemoteShoppingState
{
  RemoteAddShoppingLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RemoteAddShoppingDone extends RemoteShoppingState
{
  RemoteAddShoppingDone();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RemoteAddShoppingError extends RemoteShoppingState
{
  RemoteAddShoppingError(DioException error):super(error: error);
  @override
  // TODO: implement props
  List<Object?> get props => [error!];

}
class RemoteDeleteShoppingLoading extends RemoteShoppingState
{
  RemoteDeleteShoppingLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RemoteDeleteShoppingDone extends RemoteShoppingState
{
  RemoteDeleteShoppingDone(bool data):super.delete(booldelete: data);
  @override
  // TODO: implement props
  List<Object?> get props => [booldelete!];
}
class RemoteDeleteShoppingError extends RemoteShoppingState
{
  RemoteDeleteShoppingError(DioException error):super.delete(error: error);

  @override
  // TODO: implement props
  List<Object?> get props => [error!];
}