

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Login/Data/Data_Source/Remote/registerService.dart';
import 'package:digikalaapp/Feature/Login/Data/Model/RegisterDTO.dart';
import 'package:digikalaapp/Feature/Login/Domain/Entity/registerEntity.dart';
import 'package:digikalaapp/Feature/Login/Domain/Repository/registerRepository.dart';

class registerRepositoryImpl extends registerRepository
{
  final registerService _service;
  registerRepositoryImpl(this._service);
  @override
  Future<DataState<RegisterDTO>> register(registerEntity ? myregisterentity) async{
    // TODO: implement register
    try
        {
          final mydate=RegisterDTO(Password: myregisterentity!.Password!,Email: myregisterentity!.Email,Name: myregisterentity!.Name,family: myregisterentity!.family,Country: myregisterentity!.Country,phoneNumber: myregisterentity!.phoneNumber);
          final httpResponse=await _service.Register(mydate);
          if (httpResponse.response.statusCode == HttpStatus.ok) {

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