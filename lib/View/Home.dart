import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:  FractionallySizedBox(
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
              label: 'Home',
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
    return  MaterialApp(
      home: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            slider(),
            showmycompany(),
          ],
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
