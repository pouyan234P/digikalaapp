import 'package:digikalaapp/Feature/Login/Data/Data_Source/Remote/registerService.dart';
import 'package:digikalaapp/Feature/Login/Data/Repository/registerRepositoryImpl.dart';
import 'package:digikalaapp/Feature/Login/Domain/Repository/registerRepository.dart';
import 'package:digikalaapp/Feature/Login/Domain/Usecase/get_register_usecase.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/remote_register_Bloc.dart';
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
import 'package:digikalaapp/Feature/ShoppingCart/Data/Data_Source/Remote/shoppingService.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Repository/shoppingRepositoryImpl.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Repository/shoppingRepository.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Usecase/get_shoppingCart.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_Bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'Feature/Search/Data/Repository/searchProductRepositoryImpl.dart';

final s1=GetIt.instance;

Future<void> initialDependencies() async
{
  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton<ProductService>(ProductService(s1<Dio>()));
  s1.registerSingleton<CategorySearchRepository>(CategorySearchRepositoryImpl(s1<ProductService>()));
  s1.registerSingleton<GetCategorySearchUseCase>(GetCategorySearchUseCase(s1<CategorySearchRepository>()));
  s1.registerFactory<RemoteCategoryBloc>(() => RemoteCategoryBloc(s1<GetCategorySearchUseCase>()));
  s1.registerSingleton<UserpointService>(UserpointService(s1<Dio>()));
  s1.registerSingleton<UserPointRepository>(UserpointRepositoryImpl(s1<UserpointService>()));
  s1.registerSingleton<GetUserpointUsecase>(GetUserpointUsecase(s1<UserPointRepository>()));
  s1.registerFactory<RemoteUserpointBloc>(() => RemoteUserpointBloc(s1<GetUserpointUsecase>()));
  s1.registerSingleton<searchProductService>(searchProductService(s1<Dio>()));
  s1.registerSingleton<searchProductRepository>(searchProductRepositoryImpl(s1<searchProductService>()));
  s1.registerSingleton<GetsearchProductUseCase>(GetsearchProductUseCase(s1<searchProductRepository>()));
  s1.registerFactory<RemotesearchProductBloc>(() => RemotesearchProductBloc(s1<GetsearchProductUseCase>()));
  s1.registerSingleton<shoppingService>(shoppingService(s1<Dio>()));
  s1.registerSingleton<shoppingRepository>(shoppingRepositoryImpl(s1<shoppingService>()));
  s1.registerSingleton<GetShoppingCartUseCase>(GetShoppingCartUseCase(s1<shoppingRepository>()));
  s1.registerFactory<RemoteShoppingBloc>(() => RemoteShoppingBloc(s1<GetShoppingCartUseCase>()));
  s1.registerSingleton<registerService>(registerService(s1<Dio>()));
  s1.registerSingleton<registerRepository>(registerRepositoryImpl(s1<registerService>()));
  s1.registerSingleton<getRegisterUsecase>(getRegisterUsecase(s1<registerRepository>()));
  s1.registerFactory<remoteRegisterBloc>(() => remoteRegisterBloc(s1<getRegisterUsecase>()));
}