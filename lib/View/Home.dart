import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Category.dart';
class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homestate();
  }


}
class Homestate extends State<Home>
{
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return Scaffold(
      appBar:AppBar(title:
      FractionallySizedBox(
        widthFactor: 1.05,
        child:
        TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFF0F0F1)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("دیجی کالا",style: TextStyle(fontSize: 25,color: Colors.red),),
              SizedBox(width: 10,),
              Text('جستجو در ',style: TextStyle(fontSize: 20,color: Colors.grey),),
              // Add spacing between the icon and text
              SizedBox(width: 10),
              Icon(Icons.search,color: Colors.grey,),
            ],
          ),

        ),
      ) ,
      ),
      body: MyHome(),
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
              case 2:
                {
                  //Shopping Basket Page;
                  break;
                }
            }
          });
        },
      ),
    );
  }

}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Center(
        child:SingleChildScrollView(
          child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            slider(),
            showmycompany(),
            advirtisment(),
            Advirtismentsomeproduct(),
            Advirtismentmarket(),
            categoryplace(),
          ],
                  ),
        )

      ),
      debugShowCheckedModeBanner: false,
    );
  }

}
class slider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      const SizedBox(width: 250,);
   return myslider();
  }
}

class myslider extends State<slider> {
  @override
  Widget build(BuildContext context) {
    List<String> myimage=
        [
          'assets/images/firstpicturesaved.jpeg',
          'assets/images/secondpicturesaved.jpeg'
        ];
   return CarouselSlider(
      options: CarouselOptions(
        height: 200.0, // Height of the carousel
        viewportFraction: 0.8, // Fraction of the screen to occupy
        initialPage: 0, // Initial page index
        enableInfiniteScroll: true, // Enables infinite scrolling
        reverse: false, // Reverses the scrolling direction
        autoPlay: true, // Enables autoplay
        autoPlayInterval: Duration(seconds: 3), // Autoplay interval
        autoPlayAnimationDuration: Duration(milliseconds: 800), // Autoplay animation duration
        autoPlayCurve: Curves.fastOutSlowIn, // Autoplay animation curve
        enlargeCenterPage: true, // Enlarges the current page
        enlargeFactor: 0.3, // Enlargement factor for the current page
        scrollDirection: Axis.horizontal,
      ),
      items: myimage.map((imageurl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width, // Full width container // Horizontal margin
                height: 500,
              child:Column(

                children: [
                  Image.asset(
                      imageurl,
                  )
                ],
              )
            );
          },
        );
      }).toList(),
    );
  }
}
class showmycompany extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(

        children: [
          //retrrtretertert
        Directionality(
        textDirection: TextDirection.rtl,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: (){}, child:  Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image radius
                    child: Image.asset('assets/images/digijet.png',height: 60,),
                  ),
                  const Text('دیجی کالا جت')
                ],
              ),
              ),
              TextButton(
                onPressed: (){}, child:  Column(

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image radius
                    child: Image.asset('assets/images/digipay.png',height: 60,),
                  ),
                  const Text('دریافت وام')
                ],
              ),
              ),
              TextButton(
                onPressed: (){}, child:  Column(

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image radius
                    child: Image.asset('assets/images/digistyle.png',height: 60,),
                  ),
                  Text('حراج استایل')
                ],
              ),
              ),
              TextButton(
                onPressed: (){}, child:  Column(

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image radius
                    child: Image.asset('assets/images/supermarket.png',height: 60,),
                  ),
                  Text('سوپرمارکت')
                ],
              ),
              ),
            ],
          ) ,
        ),
          Directionality(
            textDirection: TextDirection.rtl,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){}, child:  Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image radius
                      child: Image.asset('assets/images/gamenet.png',height: 60,),
                    ),
                    const Text('گیم نت')
                  ],
                ),
                ),
                TextButton(
                  onPressed: (){}, child:  Column(

                  children: [
                      ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image radius
                      child: Image.asset('assets/images/digiplus.png',height: 60,),
                    ),
                    const Text('دیجی پلاس')
                  ],
                ),
                ),
                TextButton(
                  onPressed: (){}, child:  Column(

                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image radius
                      child: Image.asset('assets/images/digifast.png',height: 60,),
                    ),
                    Text('ارسال سریع')
                  ],
                ),
                ),
                TextButton(
                  onPressed: (){}, child: const Column(

                  children: [
                    Icon(Icons.ac_unit_sharp),
                    Text('data')
                  ],
                ),
                ),
              ],
            ) ,
          ),
        ],
      ),
    );
  }

}
class advirtisment extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return advirtismentstate();
  }
}
class advirtismentstate extends State<advirtisment>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Center(child:  Container(
               decoration: const BoxDecoration(color: Colors.red),
               height: MediaQuery.of(context).size.height*.35,
               child:
               Directionality(textDirection: TextDirection.rtl,
               child:
               ListView(
                 padding: const EdgeInsets.all(25),
                 scrollDirection: Axis.horizontal,
                 children:    [

                   Row(
                     children: [
                       Container(margin: EdgeInsets.only(top: 20) ,
                       child: Column(
                         
                         children: [
                           Image.asset('assets/images/Amazings.jpeg',height: 60,),
                           Image.asset('assets/images/box.jpeg',height: 80,),
                           TextButton(onPressed: (){}, child:
                           Text('مشاهده همه',style: TextStyle(fontSize: 15),))

                         ],
                       ),
                       ),
                        Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.3,
                          child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                                                 ),
                        ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*.35,
                         height: MediaQuery.of(context).size.height*.3,
                         child: Card(
                           child: Container(
                             padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                             child: Column(
                               children: [
                                 Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                                 const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                 const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                                 const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                               ],
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               )
                 ,),
         ),
    );
  }

}
class Advirtismentsomeproduct extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children:[
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                Image.asset('assets/images/part1.jpeg',width: MediaQuery.of(context).size.width*.43,),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                Image.asset('assets/images/part2.jpeg',width: MediaQuery.of(context).size.width*.43,),
              ),
            ],
          ),

        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                Image.asset('assets/images/part3.jpeg',width: MediaQuery.of(context).size.width*.43,),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                Image.asset('assets/images/part4.jpeg',width: MediaQuery.of(context).size.width*.43,),
              ),
            ],
          ),

        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
class Advirtismentmarket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return advirtismentmarketstate();
  }
}
class advirtismentmarketstate extends State<Advirtismentmarket>
  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Center(child:
      Container(
      decoration: const BoxDecoration(color: Colors.lightGreen),
      height: MediaQuery.of(context).size.height*.35,
      child:
      Directionality(textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(25),
          scrollDirection: Axis.horizontal,
          children:    [

            Row(
              children: [
                Container(margin: EdgeInsets.only(top: 20) ,
                  child: Column(

                    children: [
                      Image.asset('assets/images/Amazings.jpeg',height: 60,),
                      Image.asset('assets/images/box.jpeg',height: 80,),
                      TextButton(onPressed: (){}, child:
                      Text('مشاهده همه',style: TextStyle(fontSize: 15),))

                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.35,
                  height: MediaQuery.of(context).size.height*.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/advertisment1.png',width: 60,height: 80,),
                          const Text('گوشی موبایل جی پلاس مدل Q20 دو سیم کارت',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          const Text('ارسال امروز',style: TextStyle(fontSize: 12.5)),
                          const Text(' ۳,۲۹۹,۰۰۰ تومان',style: TextStyle(fontSize: 12.15))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
        ,),
    ),
    );
  }
  }
  class categoryplace extends StatelessWidget
  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:
       Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('خرید بر اساس دسته بندی',style: TextStyle(fontSize: 17,color: Colors.black),),
          const SizedBox(
            height: 15,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {},
                child:
                Column(children:[
                Image.asset('assets/images/mobilecategory.png',width:MediaQuery.of(context).size.width*.25),
                  const Text('موبایل'),
                ],
                ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/kalacategor.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('کالای دیجیتال'),
                  ],
                  ),
                ),
              ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/kitchencategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('خانه و اشپزخانه'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/modelandclothscatagory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('مد و پوشاک'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/supermarketcategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('کالاهای '
                        'سوپرمارکتی'),
                  ],
                  ),
                ),
              ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/bookscategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('کتاب لوازم تحریر\n        و هنر'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/toyscategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('اسباب بازی کودک\n         و نوزاد'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/beautycategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('زیبایی و '
                        'سلامت'),
                  ],
                  ),
                ),
              ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/sportandtravelcategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('ورزش و سفر'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/abzaryandtajehjatcategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('ابزار آلات و\n  تجهیزات'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/carandmotorcekletcategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('خودرو و\n '
                        'موتورسیکلت'),
                  ],
                  ),
                ),
              ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/bomiproductcategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('محصولات بومی و\n          محلی'),
                  ],
                  ),
                ),
                TextButton(onPressed: () {},
                  child:
                  Column(children:[
                    Image.asset('assets/images/giftcardcategory.png',width:MediaQuery.of(context).size.width*.25),
                    const Text('کارت هدیه'),
                  ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  }


