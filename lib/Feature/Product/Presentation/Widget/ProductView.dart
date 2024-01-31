import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_event.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_state.dart';
import 'package:digikalaapp/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../../Domain/Usecase/get_CategorySearch.dart';
import '../Bloc/Categorybloc/remote/remote_category_bloc.dart';
String ? data;
var t;
class Productview extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    t=context;
    data = ModalRoute.of(context)!.settings.arguments as String? ?? "";
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
    t=context;
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return  MaterialApp(
      home:
      Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
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
  final RemoteCategoryBloc yourBloc = s1<RemoteCategoryBloc>();
  final ScrollController _scrollController = ScrollController();

  int sum=0;
  @override
  void initState() {
    super.initState();
    //_postBloc = BlocProvider.of<PostBloc>(context);
    //_postBloc.add(FetchPosts(page: 1, pageSize: 10));

    _scrollController.addListener(_onScroll);
  }

  @override


  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Fetch more posts when reaching the end of the list

      sum++;
        yourBloc.add( GetCategoryProductEvent(data!,sum));


      // _postBloc.add(FetchPosts(page: 2, pageSize: 10));
    }
  }
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    // TODO: implement build

    return
      BlocProvider(
        create: (context)=>yourBloc,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("کوشی موبایل",style:
            TextStyle(
                fontSize: 12
            ),
            ),
           BlocBuilder<RemoteCategoryBloc,RemoteCategoryState>(
               builder: (context,state){
                 if(state is RemoteCategoryLoading)
                   {
                     sum++;
                     yourBloc.add( GetCategoryProductEvent(data!,sum));
                     return CircularProgressIndicator();
                   }
                 if(state is RemoteCategoryDone)
                   {

                     return  SizedBox(
                       height: size.height*.7,
                       child: ListView.builder(
                           shrinkWrap: true,
                           itemCount:state.categoryproduct!.length,
                           controller: _scrollController,
                           itemBuilder: (context,index) {
                             return  Directionality(
                               textDirection: TextDirection.rtl,
                               child: GestureDetector(
                                 onTap: (){
                                   Navigator.pushNamed(t,'/singlePageproduct',arguments: state.categoryproduct![index].id!,);
                                 },
                                 child: ListTile(
                                   title:const Text("ارسال رایکان", style:
                                   TextStyle(
                                       fontSize: 11
                                   ),
                                   ) ,
                                   subtitle:
                                   Column(
                                     children: [
                                       SizedBox(
                                         width: size.width*.7,
                                         child: Text(state.categoryproduct![index].name!,
                                           style: const TextStyle(
                                               fontSize: 12.5
                                           ),
                                           softWrap: true,
                                           maxLines: 2, // Set the maximum number of lines to 2
                                           overflow: TextOverflow.ellipsis,
                                         ),
                                       ),
                                       const Text("ارسال امروز", style:
                                       TextStyle(
                                           fontSize: 20
                                       ),
                                       ),
                                     ],
                                   ),
                                   leading:  SizedBox(
                                       width: size.width*.2,
                                       child: Image.network(state.categoryproduct![index].mainpictureUrlID!)),

                                 ),
                               ),
                             );

                           }
                       ),
                     );
                   }
                 return Container();
               })
          ],
        ),
      );

  }

}