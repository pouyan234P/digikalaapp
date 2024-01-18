




import 'dart:io';

import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/ProductService.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/ProductModel.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/CategorySearchRepository.dart';

class CategorySearchRepositoryImpl implements CategorySearchRepository
{
  final ProductService _productService;
  CategorySearchRepositoryImpl(this._productService);
  @override
  Future<DataState<List<ProductModel>>> getProductsbyname(String ?name) async {
    // TODO: implement getProducts
    try {
      final httpResponse = await _productService.getProductbyCategory(name);
      if (httpResponse.response.statusCode == HttpStatus.ok) {

        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
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

  @override
  Future<DataState<ProductModel>> getproductbyid(int ? id) async {
    // TODO: implement getproductbyid
    try
        {
          final httpResponse=await _productService.getProductbyId(id);
          if(httpResponse.response.statusCode==HttpStatus.ok)
            {
              return DataSuccess(httpResponse.data);
            }
          else
            {
              return DataFailed(
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