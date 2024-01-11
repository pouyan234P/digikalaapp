import 'package:equatable/equatable.dart';
import '../../../../Domain/Entity/ProductEntity.dart';
import 'package:dio/dio.dart';

abstract class RemoteCategoryState extends Equatable
{
  final List<ProductEntity> ? categoryproduct;
  final DioException ? error;

  const RemoteCategoryState({this.categoryproduct, this.error});
  List<Object> get props =>[categoryproduct!,error!];
}
class RemoteCategoryLoading extends RemoteCategoryState
{

  const RemoteCategoryLoading();
}
class RemoteCategoryInitial extends RemoteCategoryState {}
class RemoteCategoryDone extends RemoteCategoryState
{
  const RemoteCategoryDone(List<ProductEntity> data);
}
class RemoteCategoryError extends RemoteCategoryState
{
  const RemoteCategoryError(DioException dioException);
}