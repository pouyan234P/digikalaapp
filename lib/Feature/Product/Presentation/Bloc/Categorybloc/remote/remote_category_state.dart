import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../Domain/Entity/ProductEntity.dart';
import 'package:dio/dio.dart';

abstract class RemoteCategoryState extends Equatable
{
  late
  List<ProductEntity> ?  categoryproduct;
  late DioException ? error;

   RemoteCategoryState( { this.categoryproduct, this.error});
  @override
  List<Object> get props =>[categoryproduct!];
}
class RemoteCategoryLoading extends RemoteCategoryState
{

   RemoteCategoryLoading({required super.categoryproduct});
}
class RemoteCategoryInitial extends RemoteCategoryState {
  RemoteCategoryInitial();
}
class RemoteCategoryDone extends RemoteCategoryState
{
   RemoteCategoryDone(List<ProductEntity> data):super(categoryproduct: data);
}
class RemoteCategoryError extends RemoteCategoryState
{
   RemoteCategoryError(DioException dioException):super(error: dioException);
}