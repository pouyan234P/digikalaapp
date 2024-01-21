import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/ProductService.dart';
import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/Userpoint/UserpointService.dart';
import 'package:digikalaapp/Feature/Product/Data/Repository/CategorySearchRepositoryImpl.dart';
import 'package:digikalaapp/Feature/Product/Data/Repository/Userpoint/UserpointRepositoryImpl.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/CategorySearchRepository.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/Userpoint/UserPointRepository.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/Userpoint/get_Userpoint.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/get_CategorySearch.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_bloc.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_bloc.dart';
import 'package:digikalaapp/Feature/Search/Data/Data_Source/Remote/searchProductService.dart';
import 'package:digikalaapp/Feature/Search/Domain/Repository/searchProductRepository.dart';
import 'package:digikalaapp/Feature/Search/Domain/Usecase/get_searchProduct.dart';
import 'package:digikalaapp/Feature/Search/Presentation/Bloc/remote/Remote_searchProduct_Bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'Feature/Search/Data/Repository/searchProductRepositoryImpl.dart';

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
  s1.registerFactory<searchProductService>(()=>searchProductService(s1<Dio>()));
  s1.registerFactory<searchProductRepository>(()=>searchProductRepositoryImpl(s1<searchProductService>()));
  s1.registerFactory<GetsearchProductUseCase>(()=>GetsearchProductUseCase(s1<searchProductRepository>()));
  s1.registerFactory<RemotesearchProductBloc>(() => RemotesearchProductBloc(s1<GetsearchProductUseCase>()));
}