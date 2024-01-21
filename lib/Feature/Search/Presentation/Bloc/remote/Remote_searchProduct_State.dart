import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../Domain/Entity/productEntity.dart';

abstract class RemotesearchProductState extends Equatable
{
  List<searchProductEntity> ? product;
  late DioException ? error;
  RemotesearchProductState({this.product,this.error});
}

class RemotesearchProductLoading extends RemotesearchProductState
{

  RemotesearchProductLoading();
  @override
  List<Object> get props =>[];
}
class RemotesearchProductInitial extends RemotesearchProductState {
  RemotesearchProductInitial();
  @override
  List<Object> get props =>[];
}
class RemotesearchProductDone extends RemotesearchProductState
{
  RemotesearchProductDone(List<searchProductEntity> data):super(product: data);
  @override
  List<Object> get props =>[product!];
}
class RemotesearchProductError extends RemotesearchProductState
{
  RemotesearchProductError(DioException dioException):super(error: dioException);
  @override
  List<Object> get props =>[error!];
}
