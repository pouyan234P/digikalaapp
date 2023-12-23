import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class category extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return categorystate();
  }
}
class categorystate extends State<category>
{
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    // TODO: implement build
    return Scaffold(
      appBar:
      AppBar(title:
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
      body: mycategory(),
      bottomNavigationBar:
      BottomNavigationBar
        (
        currentIndex: _index,
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
        onTap: (int index){
          setState(() {
            switch (index) {
              case 3:
                {
                  //Home Page;
                  Navigator.pop(context);
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
class mycategory extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
      home:
      SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: size.width*.05,vertical: size.height*.02),
            child:
            Column(
          
              children: [
          
               Directionality(
                 textDirection: TextDirection.rtl,
                 child:
                 Stack(
                   children: [
                     Container(
                       alignment: AlignmentDirectional.topStart,
                       child:
                       const Text("موبایل",
                         style:
                         TextStyle(fontSize: 17,
                             fontWeight:FontWeight.w700,
                             color: Colors.black),
                       ),
                     ),
                     Container(
                       alignment: AlignmentDirectional.topEnd,
                       child:
                       const Text("مشاهده همه",
                         style:
                         TextStyle(fontSize: 17,
                             fontWeight:FontWeight.w700,
                             color: Colors.black),
                       ),
                     ),
                   ],
                 ),
               ),
                SizedBox(
                  height: size.height*.02,
                ),
                 Directionality(
                   textDirection: TextDirection.rtl,
                   child: Row(
                     children: [
                       Card(
                            child:
                            Column(
                              children: [
                                Image.asset('assets/images/iphone13.png',width: size.width*.32,),
                                Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                                ),
                                Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                              ],
                            )
                        ),
                       Card(
                          child:
                          Column(
                            children: [
                              Image.asset('assets/images/powerbank.png',width: size.width*.32,height: size.height*.15,),
                              const Text("لوازم جانبی گوشی",style: TextStyle(fontSize: 15),
                              ),
                              const Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          )
                                                ),
          
                     ],
                   ),
                 ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("کالا ودیجیتال",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                     height: size.height*.25,
                    child: ListView(
          
                      scrollDirection: Axis.horizontal,
                      children:    [
          
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("خانه و اشپزخانه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(
          
                      scrollDirection: Axis.horizontal,
                      children:    [
          
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("مد و پوشاک",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("کالاهای سوپرمارکتی",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("کتاب لوازم تحریر وهنر",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("اسباب بازی کودک و نوزاد",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("زیبا و سلامت",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("ورزش و سفر",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("ابزار آلات و تجهیزات",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("خودرو و متورسیکلت",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("محصولات و بومی و محلی",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child:
                        const Text("کارت هدیه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child:
                        const Text("مشاهده همه",
                          style:
                          TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: size.height*.25,
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children:    [

                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/images/advertisment1.png',width: size.width*.32,),
                              Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                              ),
                              Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                            ],
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
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}