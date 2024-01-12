
import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/get_CategorySearch.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_bloc.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_state.dart';
import 'package:digikalaapp/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../Domain/Repository/CategorySearchRepository.dart';
import '../Bloc/Categorybloc/remote/remote_category_event.dart';

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
class mycategory extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mycategorystate();
  }
}
class mycategorystate extends State<mycategory>
{
  final RemoteCategoryBloc yourBloc =s1<RemoteCategoryBloc>();
  @override
  Widget build(BuildContext context) {
    var t=context;
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
      home:

      BlocProvider<RemoteCategoryBloc>(
        create: (context)=>yourBloc,
        child: SafeArea(
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
                        BlocListener<RemoteCategoryBloc,RemoteCategoryState>(
                          listener: (context,state)
                        {
                        if (state is RemoteCategoryDone && state.categoryproduct!=null) {
                        // Handle the successful response
                          List<ProductEntity> data=state.categoryproduct!;
                        Navigator.pushNamed(t, '/Product',arguments: data!,);
                        }
                        else if (state is RemoteCategoryError)
                        {
                        // Handle the failed response
                        print("Failed to fetch product: ${state.error}");
                        };
                        },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                yourBloc.add(const GetCategoryProductEvent('موبایل'));
                              });
        
                            },
        
                            child: Card(
                                child:
                                Column(
                                  children: [
                                    Image.asset('assets/images/iphone13.png',width: size.width*.32,),
                                    const Text("گوشی موبایل",style: TextStyle(fontSize: 15),
                                    ),
                                    const Text("2000+ کالا",style: TextStyle(fontSize: 15),)
                                  ],
                                )
                            ),
                          ),
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
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}