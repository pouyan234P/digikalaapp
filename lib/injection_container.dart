import 'package:digikalaapp/Feature/Product/Data/Data_Source/Remote/ProductService.dart';
import 'package:digikalaapp/Feature/Product/Data/Repository/CategorySearchRepositoryImpl.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/CategorySearchRepository.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/get_CategorySearch.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final s1=GetIt.instance;

Future<void> initialDependencies() async
{
  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton<ProductService>(ProductService(s1<Dio>()));
  s1.registerSingleton<CategorySearchRepository>(CategorySearchRepositoryImpl(s1<ProductService>()));
  s1.registerSingleton<GetCategorySearchUseCase>(GetCategorySearchUseCase(s1<CategorySearchRepository>()));
  s1.registerFactory<RemoteCategoryBloc>(() => RemoteCategoryBloc(s1<GetCategorySearchUseCase>()));
}