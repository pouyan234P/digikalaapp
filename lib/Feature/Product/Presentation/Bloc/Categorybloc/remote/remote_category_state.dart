import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../Domain/Entity/ProductEntity.dart';
import 'package:dio/dio.dart';

abstract class RemoteCategoryState extends Equatable
{
  late
  List<ProductEntity> ?  categoryproduct;
  ProductEntity ? takproduct;
  late DioException ? error;

   RemoteCategoryState( { this.categoryproduct, this.error});
   RemoteCategoryState.y({this.takproduct,this.error});


}

class RemoteCategoryLoading extends RemoteCategoryState
{

   RemoteCategoryLoading();
   @override
   List<Object> get props =>[];
}
class RemoteCategoryInitial extends RemoteCategoryState {
  RemoteCategoryInitial();
  @override
  List<Object> get props =>[];
}
class RemoteCategoryDone extends RemoteCategoryState
{
   RemoteCategoryDone(List<ProductEntity> data):super(categoryproduct: data);
   @override
   List<Object> get props =>[categoryproduct!];
}
class RemoteCategoryError extends RemoteCategoryState
{
   RemoteCategoryError(DioException dioException):super(error: dioException);
   @override
   List<Object> get props =>[error!];
}
class RemoteProductLoading extends RemoteCategoryState
{
  RemoteProductLoading();
  @override
  List<Object> get props =>[];
}
class RemoteProductDone extends RemoteCategoryState
{
  RemoteProductDone(ProductEntity data):super.y(takproduct: data);
  @override
  List<Object> get props =>[takproduct!];

}
class RemoteProductError extends RemoteCategoryState
{
  RemoteProductError(DioException dioException):super.y(error: dioException);
  @override
  List<Object> get props =>[error!];
}
