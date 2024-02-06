
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Login/Data/Data_Source/Remote/Login/loginService.dart';
import 'package:digikalaapp/Feature/Login/Data/Model/Login/loginModel.dart';
import 'package:digikalaapp/Feature/Login/Domain/Entity/loginEntity.dart';
import 'package:digikalaapp/Feature/Login/Domain/Repository/Login/loginRepository.dart';

class loginRepositoryImpl extends loginRepository
{
  final loginService _service;
  loginRepositoryImpl(this._service);
  @override
  Future<DataState> Login(loginEntity? myLoginEntity) async {
    // TODO: implement Login
    try
        {
          final mydata=loginModel(Password: myLoginEntity!.Password!,Email: myLoginEntity!.Email!);
          final httpResponse=await _service.Login(mydata);
          if(httpResponse.response.statusCode==HttpStatus.ok)
            {
              return DataSuccess(httpResponse.data!);
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
        }on DioException catch(e)
    {
      return DataFailed(e);
    }
  }

}