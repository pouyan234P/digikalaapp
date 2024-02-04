import 'package:digikalaapp/Feature/Login/Presentation/Page/Login.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Page/Register.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Widget/Category.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Widget/ProductView.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Widget/SinglepageProduct.dart';
import 'package:digikalaapp/Feature/Profile/Presentation/Widget/Profile.dart';
import 'package:digikalaapp/Feature/Search/Presentation/Widget/SearchUi.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Widget/ShoppingUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Feature/Home/Presentation/Widget/Home.dart';
import 'injection_container.dart';
Future<void> main()
async {
  await initialDependencies();
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
        '/':(context)=>register(),
        '/category':(context)=>category(),
        '/profile':(context)=>profile(),
        '/Product':(context)=>Productview(),
        '/singlePageproduct':(context)=>singlePageproduct(),
        '/Search':(context)=>SearchUi(),
        '/Shopping':(context)=>ShoppingUi(),
      },
      debugShowCheckedModeBanner: false,
    );
  }

}