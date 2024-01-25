

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../Domain/Entity/cartDetailShoppingEntity.dart';

abstract class RemoteShoppingState extends Equatable
{
  late List<cartDetailShoppingEntity> ? listshoppingcart;
  late DioException ? error;
  RemoteShoppingState({this.listshoppingcart,this.error});
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