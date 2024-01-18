import 'package:digikalaapp/Feature/Product/Presentation/Widget/Category.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Widget/ProductView.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Widget/SinglepageProduct.dart';
import 'package:digikalaapp/Feature/Profile/Presentation/Widget/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Feature/Home/Presentation/Widget/Home.dart';
import 'injection_container.dart';
Future<void> main()
async {
  await initialDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(Myapp());
}

class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(),
        '/category':(context)=>category(),
        '/profile':(context)=>profile(),
        '/Product':(context)=>Productview(),
        '/Singlepageproduct':(context)=>singlePageproduct(),
      },
      debugShowCheckedModeBanner: false,
    );
  }

}
class SimpleBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('$bloc error: $error');
  }
}