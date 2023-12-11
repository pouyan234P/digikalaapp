import 'package:flutter/material.dart';
import 'View/Home.dart';
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
        '/':(context)=>Home()
      },
      debugShowCheckedModeBanner: false,
    );
  }

}