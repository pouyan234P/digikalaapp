
import 'package:dio/dio.dart';
import 'package:digikalaapp/Feature/Login/Data/Model/Login/loginModel.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../Core/Constants/Constants.dart';
part 'loginService.g.dart';
@RestApi(baseUrl: Auth)
abstract class loginService
{
  factory loginService(Dio dio)=_loginService;
  @POST('/Login')
  Future<HttpResponse> Login(@Body() loginModel ?  myLoginModel);
}