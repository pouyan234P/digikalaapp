
import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:dio/dio.dart';
import 'package:digikalaapp/Feature/Login/Data/Model/RegisterDTO.dart';
import 'package:retrofit/retrofit.dart';
part 'registerService.g.dart';
@RestApi(baseUrl: Auth)
abstract class registerService
{
  factory registerService(Dio dio)=_registerService;
  @POST('/Register')
  Future<HttpResponse> Register(@Body() RegisterDTO ?  myregisterModel);
}