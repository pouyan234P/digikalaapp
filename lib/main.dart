import 'package:digikalaapp/Feature/Category/Presentation/Widget/Category.dart';
import 'package:digikalaapp/Feature/Profile/Presentation/Widget/Profile.dart';
import 'package:flutter/material.dart';
import 'Feature/Home/Presentation/Widget/Home.dart';
void main()
{
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
        '/profile':(context)=>profile()
      },
      debugShowCheckedModeBanner: false,
    );
  }

}