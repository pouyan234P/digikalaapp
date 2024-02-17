
import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/Userpoint/UserpointModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'UserpointService.g.dart';

@RestApi(baseUrl: UserpointUrl)
abstract class UserpointService
{
  factory UserpointService(Dio dio)=_UserpointService;

  @GET('/GetUserpoints/{productid}')
  Future<HttpResponse<List<UserpointModel>>> GetUserpoints(@Path('productid') int ? productid);
  @POST('/addUserpoint')
  Future<HttpResponse> addUserpoint(@Body() UserpointModel ? userPointmodel,@Header('Authorization')String token);
}