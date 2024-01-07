import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profilestate();
  }
}
class profilestate extends State<profile>
{
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:
      AppBar(title:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            child:   IconButton(onPressed: (){},
              icon: const Icon(Icons.settings),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topEnd,
            child:   IconButton(onPressed: (){},
              icon: const Icon(Icons.add_alert_outlined),
            ),
          )
        ],
        ),
      ),),
      body: mainbody(),
      bottomNavigationBar:
      BottomNavigationBar
        (
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account_rounded),
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
              label: 'Home',
              backgroundColor: Colors.white70,
              activeIcon: Icon(Icons.home,size: 55,)
          ),
        ],
        onTap: (int index){
          setState(() {
            switch (index) {
              case 3:
                {
                  //Home Page;
                  Navigator.pushNamed(context,'/');
                  break;
                }
              case 2:
                {
                  //Account Page;
                  Navigator.pop(context);
                  Navigator.pushNamed(context,'/category');
                  break;
                }
              case 1:
                {
                  //Shopping Basket Page;
                  break;
                }
              case 0:
                {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                }
            }
          });
        },
      ),
    );
  }
}
class mainbody extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return   MaterialApp(
      home:
      SafeArea(
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              const FractionallySizedBox(
                widthFactor:1 ,
                child:
                Center(
                child:
                  Text("پویان پرورش",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                  ),
                ) ,
              ),
              const FractionallySizedBox(
                widthFactor:1 ,
                child:
                Center(
                  child:
                  Text("09022887856",
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),
                ) ,
              ),
              SizedBox(
                height: size.height*.1,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Image.asset('assets/images/club-point_prev_ui.png',width: size.width*.1,),
                    const Column(children:[
                      Text("0 امتیاز",
                        style: TextStyle(
                            fontSize: 8,
                          color: Colors.grey
                        ),
                      ),
                    Text("ماموریت های دیجی کلاب >",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.lightBlue
                    ),
                    ),
                    ]
                    ),
                    SizedBox(
                      width: size.width*.25,
                    ),
                    Column(children:[
                      Image.asset('assets/images/profile-wallet.png',
                        width: size.width*.1),
                      const Text("فعال سازی کیف پول",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black
                      ),
                      ),
              ],
          ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height*.02,
              ),
              SizedBox(
                height: size.height*.01,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: FractionallySizedBox(
                  widthFactor: .9,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height*.03,left: size.width*.03,right: size.width*.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              child: Image.asset('assets/images/user.png',height: size.height*.031,)
                              ),
                            const Text("احراز هویت",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                            ),)

                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                                child: Image.asset('assets/images/user.png')
                            ),
                            const Text("احراز هویت",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                              ),)

                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child:
                                Image.asset('assets/images/customer-support.png',height: size.height*.031)
                            ),
                            const Text("تماس با ما",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height*.02,
              ),
              SizedBox(
                height: size.height*.01,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*.6,top: size.height*.02),
                child: const Text("سفارش های من",
                    style:
                  TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(
                height:size.height*.02 ,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: MediaQuery.of(context).size.height*.1,
                  margin: EdgeInsets.only(right: size.width*.07),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/images/stopwatch.png",height: size.height*.07),
                                const Text("در انتظار پرداخت",
                                style:
                                  TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900
                                  ),)
                              ],
                            ),
                            SizedBox(
                              width: size.width*.02,
                            ),
                            VerticalDivider(),
                            Column(
                              children: [
                                Image.asset("assets/images/conveyor-belt.png",height: size.height*.07),
                                const Text("در حال پردازش",
                                  style:
                                  TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900
                                  ),)
                              ],
                            ),
                            SizedBox(
                              width: size.width*.02,
                            ),
                            VerticalDivider(),
                            Column(
                              children: [
                                Image.asset("assets/images/door-to-door.png",height: size.height*.07),
                                const Text("تحویل شده",
                                  style:
                                  TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900
                                  ),)
                              ],
                            ),
                            SizedBox(
                              width: size.width*.02,
                            ),
                            VerticalDivider(),
                            Column(
                              children: [
                                Image.asset("assets/images/cancel.png",height: size.height*.07),
                                const Text("لغو شده",
                                  style:
                                  TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900
                                  ),)
                              ],
                            ),
                            SizedBox(
                              width: size.width*.02,
                            ),
                            VerticalDivider(),
                            Column(
                              children: [
                                Image.asset("assets/images/return.png",height: size.height*.07),
                                const Text("مرجوع شده",
                                  style:
                                  TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900
                                  ),)
                              ],
                            ),
                            SizedBox(
                              width: size.width*.02,
                            ),
                            VerticalDivider(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height*.02,
              ),
              GestureDetector(
                child:
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width*.2,
                          child: const Icon(Icons.favorite_border),
                      ),
                      SizedBox(
                        width: size.width*.000001,
                      ),
                      const Text("لیست ها",
                      style:
                        TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        width: size.width*.55,
                      ),
                      const Text(">",
                      style:
                        TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width*.7, // Full width
                height: 2, // Adjust height
                color: Colors.grey,
              ),
              GestureDetector(
                child:
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width*.2,
                        child: const Icon(Icons.favorite_border),
                      ),
                      SizedBox(
                        width: size.width*.04,
                      ),
                      const Text("لیست ها",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        width: size.width*.55,
                      ),
                      const Text(">",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width*.7, // Full width
                height: 2, // Adjust height
                color: Colors.grey,
              ),
              GestureDetector(
                child:
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width*.2,
                        child: const Icon(Icons.favorite_border),
                      ),
                      SizedBox(
                        width: size.width*.04,
                      ),
                      const Text("لیست ها",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        width: size.width*.55,
                      ),
                      const Text(">",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width*.7, // Full width
                height: 2, // Adjust height
                color: Colors.grey,
              ),
              GestureDetector(
                child:
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width*.2,
                        child: const Icon(Icons.favorite_border),
                      ),
                      SizedBox(
                        width: size.width*.04,
                      ),
                      const Text("لیست ها",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        width: size.width*.55,
                      ),
                      const Text(">",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width*.7, // Full width
                height: 2, // Adjust height
                color: Colors.grey,
              ),
              GestureDetector(
                child:
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width*.2,
                        child: const Icon(Icons.favorite_border),
                      ),
                      SizedBox(
                        width: size.width*.04,
                      ),
                      const Text("لیست ها",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        width: size.width*.55,
                      ),
                      const Text(">",
                        style:
                        TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }



}