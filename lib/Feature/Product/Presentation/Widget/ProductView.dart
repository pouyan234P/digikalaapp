import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class Productview extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:Productbuild() ,
    );
  }
}
class Productbuild extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return  MaterialApp(
      home:
      SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children:
            [
              SizedBox(
                height: size.height*.025,
              ),
            MyHeader(),
             Myfilter(),

              Container(
                height: size.height*.012,
                color: Colors.grey,

              ),
              Mylocation(),
              Container(
                height: size.height*.012,
                color: Colors.grey,

              ),
             ListProduct(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHeader extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFF0F0F1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {},
      child: const Row(
        children: [
          Icon(Icons.search,color: Colors.grey,),
          SizedBox(width: 10),
          Text('جستجو در ',style: TextStyle(fontSize: 20,color: Colors.grey),),
          SizedBox(width: 10,),
          Text("دیجی کالا",style: TextStyle(fontSize: 25,color: Colors.red),),


          // Add spacing between the icon and text

        ],
      ),

    );
  }

}
class Myfilter extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Row(
        children:
        [
          TextButton(onPressed: () {},
            child:
            Row(
              children: [

               Image.asset("assets/images/filter.png",height:size.height*.025,),
                SizedBox(
                  width: size.width*.025,
                ),
                const Text("فیلتر",style:
                TextStyle(
                    fontSize: 12
                ),)
              ],
            ),
          ),
          SizedBox(
            width: size.width*.1,
          ),
          TextButton(onPressed: () {}, child:
          Row(
            children: [
              Image.asset("assets/images/select.png",height:size.height*.02),
              SizedBox(
                width: size.width*.025,
              ),
              const Text("منتخب",style:
              TextStyle(
                  fontSize: 12
              ),
              ),

            ],
          ),
          ),
          SizedBox(
            width: size.width*.35,
          ),
          TextButton(onPressed: () {}, child:
          Image.asset("assets/images/social.png",height: size.height*.025,),
          ),

        ]
    );
  }

}
class Mylocation extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Padding(
      padding: EdgeInsets.only(top: 10,right: 20,bottom: 10),
      child:  Row(
        children: [
          Icon(Icons.gps_fixed_outlined),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text("ارسال به",style:
            TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 14
            ),),
          )
        ],
      ),
    );
  }

}
class ListProduct extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListProductstate();
  }

}
class ListProductstate extends State<ListProduct>
{
  List<String> data = ["Item 1", "Item 2", "Item 3"];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          const Text("کوشی موبایل",style:
          TextStyle(
              fontSize: 20
          ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
              itemBuilder: (context,index) {
                return const Row(
                  children: [
                    //Image.network("src"),
                    Column(
                      children: [
                        Text("ارسال رایکان", style:
                        TextStyle(
                            fontSize: 20
                        ),
                        ),
                        Text("data", style:
                        TextStyle(
                            fontSize: 20
                        ),
                        ),
                        Text("ارسال امروز", style:
                        TextStyle(
                            fontSize: 20
                        ),
                        )

                      ],
                    ),
                  ],
                );
              }

      ),
      ],
    )
    );

  }

}

