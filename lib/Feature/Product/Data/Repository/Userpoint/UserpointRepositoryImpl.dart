import 'dart:io';
import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/Userpoint/UserpointService.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/ProductModel.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/Userpoint/PointofviewModel.dart';
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

  @override
  Future<DataState> addUserpoint(UserpointEntity? userpointEntity) async{
    // TODO: implement addUserpoint
    try
        {
          String mytoken='Bearer '+token;
          final httpResponse=await _service.addUserpoint(UserpointModel(Pointofviewid: PointofviewModel(Commenttext: userpointEntity!.Pointofviewid!.Commenttext!, Commenttitle: userpointEntity!.Pointofviewid!.Commenttitle!,Negativepoints: userpointEntity!.Pointofviewid!.Negativepoints!,Positivepoints: userpointEntity!.Pointofviewid!.Positivepoints!,Score: userpointEntity!.Pointofviewid!.Score!),Userid: userpointEntity.Userid,Productid: ProductModel(id: userpointEntity!.Productid!.id!)), mytoken);
          if(httpResponse.response.statusCode==HttpStatus.ok)
            {
              return DataSuccess(httpResponse.data!);
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
        }on DioException catch(e)
    {
      return DataFailed(e);
    }
  }

}