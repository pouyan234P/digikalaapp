
import 'dart:math';

import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:digikalaapp/Feature/Login/Domain/Entity/loginEntity.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/Login/remote_login_Bloc.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/Login/remote_login_event.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/Login/remote_login_state.dart';
import 'package:digikalaapp/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class login extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginState();
  }
}
class loginState extends State<login>
{
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    // TODO: implement build
   return Scaffold(
      body:loginBody(),
     bottomNavigationBar:
     BottomNavigationBar(
       currentIndex: _index,
       items: const [
         BottomNavigationBarItem(
             icon: Icon(Icons.supervisor_account_rounded),
             label: 'Profile',
             backgroundColor: Colors.white70),
         BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart),
             label: 'Shoppingcart',
             backgroundColor: Colors.white70),
         BottomNavigationBarItem(
             icon: Icon(Icons.category),
             label: 'Category',
             backgroundColor: Colors.white70),
         BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: 'Home',
             backgroundColor: Colors.white70,
             activeIcon: Icon(
               Icons.home,
               size: 55,
             )),
       ],
       onTap: (int index) {
         setState(() {
           switch (index) {
             case 3:
               {
                 //Home Page;
                 Navigator.pop(context);
                 Navigator.pushNamed(context, '/');
                 break;
               }
             case 2:
               {
                 //Account Page;
                 Navigator.pop(context);
                 Navigator.pushNamed(context, '/category');
                 break;
               }
             case 1:
               {
                 if(token=="")
                 {
                   Navigator.pop(context);
                   Navigator.pushNamed(context, '/login');
                 }
                 else {
                   Navigator.pop(context);
                   Navigator.pushNamed(context, '/Shopping');
                 }
                 //Shopping Basket Page;
                 break;
               }
             case 0:
               {
                 if(token=="")
                 {
                   Navigator.pop(context);
                   Navigator.pushNamed(context, '/login');
                 }
                 else {
                   Navigator.pop(context);
                   Navigator.pushNamed(context, '/profile');
                 }
               }
           }
         });
       },
     ),
    );
  }

}
class loginBody extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginBodyState();
  }

}
class loginBodyState extends State<loginBody>
{
  final remoteLoginBloc yourBloc=s1<remoteLoginBloc>();
  Map<String, dynamic> formData = {};
  void _updateFieldValue(String fieldName, String value) {
    setState(() => formData[fieldName] = value);
  }
  @override
  Widget build(BuildContext context) {
   var t=context;
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
      return MaterialApp(
      home: SafeArea(
        child: BlocProvider<remoteLoginBloc>(
          create: (_)=>yourBloc,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: BlocListener<remoteLoginBloc,remoteLoginState>(
                listener: (context,state)
                {
                  if(state is remoteLoginDone)
                    {
                      token=state.mylogin!;
                      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
                      Userid=int.parse(decodedToken['nameid']);
                      log(Userid);
                      Navigator.pop(context);
                      Navigator.pushNamed(t, '/profile');
                    }
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width:double.infinity ,
                        height: size.height*.25,
                        child: const Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child:
                              Icon(Icons.settings),
                            ),
                            Positioned(
                                top: 0,
                                left: 0,
                                child:
                                Icon(Icons.cancel))
                          ],
                        ),
                      ),
                    ),
                    Image.asset('assets/images/logodigikal.jpg',width: size.width*.5,),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        width: size.width*.9,
                        child: const Text('برای ورود و یا ثبت نام در دیجی کالا شماره موبایل یا پست الکترونیکی خود را وارد نماید',style:
                          TextStyle(
                            fontSize: 12
                          ),
                        softWrap: true,
                        maxLines: 2,),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: size.width*.85,
                        height: size.height*.05,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFFD3D3D3)
                        ),
                        child:  TextField(
                          onChanged: (value) => _updateFieldValue('Email', value),
                          decoration: const InputDecoration(
                            hintText: '   ایمیل'
                          ),
                        ),
                    ),
                    SizedBox(
                      height: size.height*.025,
                    ),
                    Container(
                      width: size.width*.85,
                      height: size.height*.05,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFFD3D3D3)
                      ),
                      child:  TextField(
                        onChanged: (value) => _updateFieldValue('Password', value),
                        decoration:const InputDecoration(
                          hintText: '   رمز'
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: size.width*.85,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            backgroundColor: Colors.red,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                          onPressed: (){
                            setState(() {
                              final data=loginEntity(Email: formData['Email'],Password: formData['Password']);
                              yourBloc.add(getRemoteLoginEvent(data));
                            });

                          }, child:
                        const Text('ورود به دیجی کالا',style:
                          TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: size.width*.85,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              backgroundColor: Colors.purple,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                          onPressed: (){
                            setState(() {
                              Navigator.pushNamed(context, '/register');
                            });
                          }, child:
                        const Text('ثبت نام به دیجی کالا',style:
                        TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
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
      ),
        debugShowCheckedModeBanner: false,
    );
  }

}
