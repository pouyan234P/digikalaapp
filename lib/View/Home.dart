import 'package:flutter/material.dart';
class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHome(),
      bottomNavigationBar:BottomNavigationBar
        (

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white70
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account_rounded),
              label: "Home"
          ),
        ],
      ),
    );
  }

}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text('hello'),
      ),
    );
  }

}