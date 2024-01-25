

import 'dart:html';
import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Data_Source/Remote/shoppingService.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/cartDetailShoppingModel.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Repository/shoppingRepository.dart';

class shoppingRepositoryImpl extends shoppingRepository
{
  final shoppingService _service;
  shoppingRepositoryImpl(this._service);
  @override
  Future<DataState<List<cartDetailShoppingModel>>> GetAllShoppingcart(int? userid) async {
    try
        {
          final httpResponse=await _service.GetAllShoppingcart(userid);
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