import 'package:flutter/material.dart';
class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: TextButton(
        onPressed: () {},
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('جستجو در دیجی کالا',style: TextStyle(fontSize: 20),),
            // Add spacing between the icon and text
            SizedBox(width: 10),
            Icon(Icons.search),
          ],
        ),
      ),
      ),
      body: MyHome(),
      bottomNavigationBar:BottomNavigationBar
        (
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account_rounded),
          label: 'Profile',
          backgroundColor: Colors.white70),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
              label: 'Shoppingcart',
              backgroundColor: Colors.white70),
          BottomNavigationBarItem(icon: Icon(Icons.category),
              label: 'Category',
              backgroundColor: Colors.white70),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white70
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
      debugShowCheckedModeBanner: false,
    );
  }

}