import 'dart:io';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/Userpoint/UserpointService.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/Userpoint/UserpointModel.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/Userpoint/UserPointRepository.dart';
import 'package:dio/dio.dart';

class UserpointRepositoryImpl extends UserPointRepository
{
  final UserpointService _service;
  UserpointRepositoryImpl(this._service);

  @override
  Future<DataState<List<UserpointModel>>> GetUserpoints(int? productid) async {
    // TODO: implement GetUserpoints
    try
        {
          final httpResponse=await this._service.GetUserpoints(productid);
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