import 'package:carousel_slider/carousel_slider.dart';
import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_bloc.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_state.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_state.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddHeaderShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartHeaderShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/productAddShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/productShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Usecase/get_shoppingCart.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_Bloc.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_Event.dart';
import 'package:digikalaapp/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Domain/Usecase/get_CategorySearch.dart';
import '../Bloc/Categorybloc/remote/Userpoint/remote_userpoint_event.dart';
import '../Bloc/Categorybloc/remote/remote_category_bloc.dart';
import '../Bloc/Categorybloc/remote/remote_category_event.dart';

int ? data;
String ? average;

class singlePageproduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as int;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.cancel_outlined),
                  ),
                ),
                Positioned(
                    left: 0,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Icon(Icons.shopping_cart),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Icon(Icons.favorite_border),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: mysinglepageproduct(),

   );

  }
}

class mysinglepageproduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mysinglepagestate();
  }
}

class mysinglepagestate extends State<mysinglepageproduct> {
  RemoteCategoryBloc yourBloc= RemoteCategoryBloc.y(s1<GetCategorySearchUseCase>());
  RemoteShoppingBloc shopBloc=RemoteShoppingBloc.Add(s1<GetShoppingCartUseCase>());
  ProductEntity ? myproduct;
  var price;
  void _updatepirce(double t)
  {

      price=t;

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
      home: Stack(
        children:
            [
        BlocProvider(
          create: (_)=>yourBloc,
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocBuilder<RemoteCategoryBloc,RemoteCategoryState>(
                 builder: (context,state){
                   if(state is RemoteProductLoading)
                     {
                       yourBloc.add(GetSingleProductEvent(data!));
                       return CircularProgressIndicator();
                     }
                   if(state is RemoteProductDone)
                     {
                       myproduct=state.takproduct!;
                         var newPrice = state.takproduct!.price!;
                     WidgetsBinding.instance!.addPostFrameCallback((_) {
                       setState(() {
                         _updatepirce(newPrice as double);
                       });

                     });
                       return
                         Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 30),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 slider(),
                                 const Text(
                                   'شیاومی/گوسی موبایل شیاِِومی',
                                   style: TextStyle(fontSize: 12, color: Colors.lightBlue),
                                 ),
                                 SizedBox(
                                   width: size.width * .7,
                                   child: Text(
                                     state.takproduct!.name!,
                                     style: const TextStyle(
                                         fontSize: 13,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.black),
                                     softWrap: true,
                                     maxLines: 2,
                                   ),
                                 ),
                                 SizedBox(
                                   height: size.height * .025,
                                 ),
                                 Row(
                                   children: [
                                     const Icon(
                                       Icons.star,
                                       color: Colors.yellow,
                                     ),
                                     Text(
                                       average ?? "N/A",
                                       style: const TextStyle(fontSize: 12),
                                     ),
                                     SizedBox(
                                       width: size.width * .04,
                                     ),
                                     const Text(
                                       '2751 دیدگاه کاربران',
                                       style: TextStyle(
                                           fontSize: 12, color: Colors.lightBlue),
                                     ),
                                     SizedBox(
                                       width: size.width * .04,
                                     ),
                                     const Text(
                                       '491 پرسش و پاسخ',
                                       style: TextStyle(
                                           fontSize: 12, color: Colors.lightBlue),
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: size.width * .025,
                                 ),
                                 const Padding(
                                   padding: EdgeInsets.only(left: 70),
                                   child: Divider(
                                     height: 5,
                                     color: Colors.grey,
                                   ),
                                 ),
                                 SizedBox(
                                   height: size.height * .025,
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       'رنگ:',
                                       style: TextStyle(fontSize: 12, color: Colors.black),
                                     ),
                                     Text(
                                       state.takproduct!.color!,
                                       style: const TextStyle(
                                           fontSize: 12, color: Colors.black),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           Container(
                             height: size.height * .01,
                             color: Colors.grey,
                           ),
                           TextButton(
                               onPressed: () {},
                               child: SizedBox(
                                 height: size.height * .03,
                                 child: const Stack(
                                   children: [
                                     Positioned(
                                       right: 0,
                                       child: Text(
                                         'مشخسات فنی',
                                         style: TextStyle(fontSize: 12),
                                       ),
                                     ),
                                     Positioned(
                                       left: 0,
                                       child: Icon(Icons.keyboard_arrow_left),
                                     )
                                   ],
                                 ),
                               )),
                           const Padding(
                             padding: EdgeInsets.only(left: 25, right: 10),
                             child: Divider(
                               height: 5,
                               color: Colors.grey,
                             ),
                           ),
                           TextButton(
                               onPressed: () {},
                               child: SizedBox(
                                 height: size.height * .03,
                                 child: const Stack(
                                   children: [
                                     Positioned(
                                       right: 0,
                                       child: Text(
                                         'معرفی اجمالی',
                                         style: TextStyle(fontSize: 12),
                                       ),
                                     ),
                                     Positioned(
                                       left: 0,
                                       child: Icon(Icons.keyboard_arrow_left),
                                     )
                                   ],
                                 ),
                               )),
                           Container(
                             height: size.height * .07,
                             color: Colors.grey,
                             child: Row(
                               children: [
                                 SizedBox(
                                   height: size.height * .05,
                                   child: ElevatedButton(
                                       onPressed: () {},
                                       style: ElevatedButton.styleFrom(
                                           backgroundColor: Colors.white,
                                           shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(25.0))),
                                       child: Row(
                                         children: [
                                           Image.asset(
                                             'assets/images/iphone13.png',
                                             width: size.width * .1,
                                             height: size.height * .09,
                                           ),
                                           SizedBox(
                                             width: size.width * .025,
                                           ),
                                           const Text(
                                             'گوشی موبایل',
                                             style: TextStyle(fontSize: 12),
                                           ),
                                           const Icon(Icons.keyboard_arrow_left)
                                         ],
                                       )),
                                 ),
                                 SizedBox(
                                   width: size.width * .025,
                                 ),
                                 ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.white,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(25.0))),
                                     child: const Row(
                                       children: [
                                         Text(
                                           'موبایل',
                                           style: TextStyle(fontSize: 12),
                                         ),
                                         Icon(Icons.keyboard_arrow_left)
                                       ],
                                     )),
                               ],
                             ),
                           ),
                           Useropinion(),
                           SizedBox(
                             height: size.height*.1,
                           )
                         ],
                                                );
                     }
                   return Container();
                 }),

              ),
          ),
        ),
              BlocProvider(
                create: (_)=>shopBloc,
                child: Positioned(
                  bottom:0,
                    child:
                    Container(
                      color: Colors.white,
                      width: size.width * 1,
                      height: size.height * 0.07,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                        children: [
                          Positioned(
                              top: 20,
                              left: 0,
                              child: Row(
                                children: [
                                  const Text('تومان',style:
                                    TextStyle(fontSize: 12),),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .025,
                                  ),
                                  Text("$price",style:
                                    TextStyle(
                                      fontSize: 12
                                    ),)
                                ],
                              )),
                          const Positioned(
                            top: -3,
                            right: 0,
                            child: Text("تنها 3 عدد در انبار باقی مانده",style:
                              TextStyle(
                                fontSize: 12
                              ),),
                          ),
                          Positioned(
                            top: 20,
                            right: 0,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .037,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    var mycartheader=cartAddHeaderShoppingEntity(Userid: Userid);
                                    var mycartproduct=productAddShoppingEntity(productid: myproduct!.id!,Name: myproduct!.name!,Picture: myproduct!.mainpictureUrlID!,Color: myproduct!.color!,Price: myproduct!.price);
                                    var mycartdetail=cartAddDetailShoppingEntity(productid: mycartproduct,Headerid: mycartheader,Count: 1);
                                    shopBloc.add(getAddShoppingEvent(mycartdetail));
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0))),
                                child: const Text(
                                  "افزودن به سبد کالا",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                ),
              ),
      ]
      ),
      debugShowCheckedModeBanner: false,
      );


  }
}

class slider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myslider();
  }
}

class myslider extends State<slider> {
  @override
  Widget build(BuildContext context) {
    List<String> myimage = [
      'assets/images/firstpicturesaved.jpeg',
      'assets/images/secondpicturesaved.jpeg'
    ];
    return CarouselSlider(
      options: CarouselOptions(
        // Height of the carousel
        viewportFraction: 0.8,
        // Fraction of the screen to occupy
        initialPage: 0,
        // Initial page index
        enableInfiniteScroll: true,
        // Enables infinite scrolling
        reverse: true,
        // Reverses the scrolling direction
        autoPlay: false,
        // Enables autoplay
        autoPlayInterval: const Duration(seconds: 3),
        // Autoplay interval
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        // Autoplay animation duration
        autoPlayCurve: Curves.fastOutSlowIn,
        // Autoplay animation curve
        enlargeCenterPage: true,
        // Enlarges the current page
        enlargeFactor: 0.3,
        // Enlargement factor for the current page
        scrollDirection: Axis.horizontal,
      ),
      items: myimage.map((imageurl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Full width container // Horizontal margin
                height: 500,
                child: Column(
                  children: [
                    Image.asset(
                      imageurl,
                    )
                  ],
                ));
          },
        );
      }).toList(),
    );
  }
}

class Useropinion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Useropinionstate();
  }
}

class Useropinionstate extends State<Useropinion> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final RemoteUserpointBloc yourBloc = s1<RemoteUserpointBloc>();
    // TODO: implement build
    return BlocProvider(
      create: (context) => yourBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * .025, horizontal: size.width * .075),
            child: const Text(
              'دیدگاه کاربری',
              style: TextStyle(fontSize: 13),
            ),
          ),
          SizedBox(
            height: size.height * .18, // Set a fixed height or adjust as needed
            child: BlocBuilder<RemoteUserpointBloc, RemoteUserpointState>(
              builder: (context, state) {
                if (state is RemoteUserpointloading) {
                  yourBloc.add(GetRemoteuserpointEvent(data!));
                  return CircularProgressIndicator();
                } else if (state is RemoteUserpointDone) {
                  calculateAverage(state.userpoint!);

                  return ListView.builder(
                    itemCount: state.userpoint!.length!,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: size.width * .60,
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.userpoint![index].Pointofviewid!
                                      .Commenttitle!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  state.userpoint![index].Pointofviewid!
                                      .Commenttext!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return Container(); // Handle other states here
              },
            ),
          )
        ],
      ),
    );
  }

  void calculateAverage(List<UserpointEntity> Point) {
    if (Point.isEmpty) {
      setState(() {
        average = '0.0';
      });
      return;
    }

    int sum = 0;
    for (var item in Point) {
      sum = sum + item.Pointofviewid!.Score!.toInt();
    }
    double myaverage = sum / Point.length;

    // Schedule the state update after the build phase using Future.microtask
    Future.microtask(() {
      setState(() {
        average = myaverage.toString();
      });
    });
  }
}
