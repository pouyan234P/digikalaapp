

import 'package:digikalaapp/Feature/Login/Domain/Entity/registerEntity.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/remote_register_Bloc.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/remote_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../Bloc/Remote/remote_register_state.dart';

class register extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('assets/images/logodigikal.jpg',height: 40,)),
      ),
      body: registerBody(),
    );
  }
}
class registerBody extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerBodyState();
  }

}
class registerBodyState extends State<registerBody>
{
  final remoteRegisterBloc yourBloc = s1<remoteRegisterBloc>();
  Map<String, dynamic> formData = {};
  void _updateFieldValue(String fieldName, String value) {
    setState(() => formData[fieldName] = value);
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
      home:SafeArea(
        child: BlocProvider<remoteRegisterBloc>(
          create: (_)=>yourBloc,
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('اسم',style:
                    TextStyle(
                      fontSize: 12
                    ),
                  ),
                   TextField(
                    onChanged: (value) => _updateFieldValue('Name', value),
                  ),
                  const Text('نام و نام خوانواده',style:
                  TextStyle(
                      fontSize: 12
                  ),
                  ),
                   TextField(
                     onChanged: (value) => _updateFieldValue('family', value),
                   ),
                  const Text('کشور',style:
                  TextStyle(
                      fontSize: 12
                  ),
                  ),
                   TextField(
                     onChanged: (value) => _updateFieldValue('Country', value),
                   ),
                  const Text('تلفن',style:
                  TextStyle(
                      fontSize: 12
                  ),
                  ),
                   TextField(
                     onChanged: (value) => _updateFieldValue('phoneNumber', value),
                   ),
                  const Text('ایمیل',style:
                  TextStyle(
                      fontSize: 12
                  ),
                  ),
                   TextField(
                     onChanged: (value) => _updateFieldValue('Email', value),
                   ),
                  const Text('رمز',style:
                  TextStyle(
                      fontSize: 12
                  ),
                  ),
                  TextField(
                    onChanged: (value) => _updateFieldValue('Password', value),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20,right: 20),
                    width: size.width*.85,
                    child: BlocListener<remoteRegisterBloc,remoteRegisterState>(
                      listener: (context,state){
                        if(state is remoteRegisterDone)
                          {

                          }
                      },
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                        ),
                          onPressed: (){
                          setState(() {
                            final mydata=registerEntity(Name: formData['Name'],phoneNumber: formData['phoneNumber'],Password: formData['Password'],family: formData['family'],Email: formData['Email'],Country: formData['Country']);
                            yourBloc.add(getRemoteRegisterEvent(mydata));
                          });
                          },
                          child:const Text('ثبت نام',style:
                            TextStyle(
                              fontSize: 12,
                              color: Colors.white
                            ),)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ) ,
      debugShowCheckedModeBanner: false,
    );

  }

}