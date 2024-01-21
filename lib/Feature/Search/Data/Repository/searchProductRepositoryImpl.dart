

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Search/Data/Data_Source/Remote/searchProductService.dart';
import 'package:digikalaapp/Feature/Search/Data/Model/searchProductModel.dart';
import 'package:digikalaapp/Feature/Search/Domain/Entity/productEntity.dart';
import 'package:digikalaapp/Feature/Search/Domain/Repository/searchProductRepository.dart';

class searchProductRepositoryImpl extends searchProductRepository
{
    searchProductService _service;
  searchProductRepositoryImpl(this._service);
  @override
  Future<DataState<List<searchProductModel>>> searchProduct(String ? name) async{
    // TODO: implement searchProduct
    try
    {
      final httpResponse=await _service.getProductbyCategory(name);
      if(httpResponse.response.statusCode==HttpStatus.ok)
        {
          return DataSuccess(httpResponse.data);
        }
      else
        {
          return  DataFailed(
              DioException(
                  error: httpResponse.response.statusMessage,
                  response: httpResponse.response,
                  type: DioExceptionType.badResponse,
                  requestOptions: httpResponse.response.requestOptions
              )
          );
        }
    } on DioException catch(e)
    {
      return DataFailed(e);
    }
  }
  
}