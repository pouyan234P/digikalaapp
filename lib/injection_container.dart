import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/ProductService.dart';
import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/Userpoint/UserpointService.dart';
import 'package:digikalaapp/Feature/Product/Data/Repository/CategorySearchRepositoryImpl.dart';
import 'package:digikalaapp/Feature/Product/Data/Repository/Userpoint/UserpointRepositoryImpl.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/CategorySearchRepository.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/Userpoint/UserPointRepository.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/Userpoint/get_Userpoint.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/get_CategorySearch.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_bloc.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final s1=GetIt.instance;

Future<void> initialDependencies() async
{
  s1.registerSingleton<Dio>(Dio());
  s1.registerFactory<ProductService>(()=>ProductService(s1<Dio>()));
  s1.registerFactory<CategorySearchRepository>(()=>CategorySearchRepositoryImpl(s1<ProductService>()));
  s1.registerFactory<GetCategorySearchUseCase>(()=>GetCategorySearchUseCase(s1<CategorySearchRepository>()));
  s1.registerFactory<RemoteCategoryBloc>(() => RemoteCategoryBloc(s1<GetCategorySearchUseCase>()));
  s1.registerSingleton<UserpointService>(UserpointService(s1<Dio>()));
  s1.registerSingleton<UserPointRepository>(UserpointRepositoryImpl(s1<UserpointService>()));
  s1.registerSingleton<GetUserpointUsecase>(GetUserpointUsecase(s1<UserPointRepository>()));
  s1.registerFactory<RemoteUserpointBloc>(() => RemoteUserpointBloc(s1<GetUserpointUsecase>()));
}