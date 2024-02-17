

import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/PointofviewEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Usecase/Userpoint/get_Userpoint.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_bloc.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_event.dart';
import 'package:digikalaapp/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Constants/Constants.dart';
import '../../Bloc/Categorybloc/remote/Userpoint/remote_userpoint_state.dart';
ProductEntity ? data;
var contextscafold;
class userpointView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    contextscafold=context;
    data= ModalRoute.of(context)!.settings.arguments as ProductEntity;
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Image.network(data!.mainpictureUrlID!,width: size.width*.1,),
                 Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('دیدگاه شما',style: TextStyle(
                        fontSize: 12
                      ),),
                      SizedBox(
                        width: size.width*.635,
                        child: Text(data!.name!,style: const TextStyle(
                            fontSize: 12
                        ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body:bodyuserpoint() ,
    );
  }

}
class bodyuserpoint extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bodyUserPointState();
  }

}
class bodyUserPointState extends State<bodyuserpoint>
{

 late double _value=0;
 late String mypoint='';
 Map<String, dynamic> formData = {};
 late List<String> listmappositive=[];
 late List<String> listmapNegative=[];
 final _textFieldControllers = <TextEditingController>[];
 final _textFieldNegativeControllers = <TextEditingController>[];
 RemoteUserpointBloc myuserbloc=RemoteUserpointBloc.Add(s1<GetUserpointUsecase>());
 void _updateFieldValue(String fieldName, String value) {
   setState(() => formData[fieldName] = value);
 }
 void _updateFieldlistmappositive(String value)
 {
   Map<String, dynamic> myformData = {};
   setState(() {
     listmappositive.add(value);
   });
 }
 void _updateFieldlistmapNegative(String value)
 {
   setState(() {
     listmapNegative.add(value);
   });
 }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
      home: BlocProvider(
        create: (_)=>myuserbloc,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(mypoint,style:
                    TextStyle(
                      fontSize: 18,
                      color: Colors.black
                    ),),
                ),
                Slider(
                  value: _value,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.grey,
                 label: 'Set font size',
                 onChanged: (double newValue) {
                   setState(() {
                     _value = newValue;
                     if(_value==0.0)
                       {
                         mypoint='';
                       }
                     if(_value==1.0)
                       {
                         mypoint='خیلی بد';
                         _updateFieldValue('Score', _value.toString());
                       }
                     if(_value==2.0)
                       {
                         mypoint='بد';
                         _updateFieldValue('Score', _value.toString());
                       }
                     if(_value==3.0)
                       {
                         mypoint='معمولی';
                         _updateFieldValue('Score', _value.toString());
                       }
                     if(_value==4.0)
                       {
                         mypoint='خوب';
                         _updateFieldValue('Score', _value.toString());
                       }
                     if(_value==5.0)
                       {
                         mypoint='خیلی خوب';
                         _updateFieldValue('Score', _value.toString());
                       }

                   });
                 },
                ),
                Container(
                  height: 2.0, // Adjust height as needed
                  color: Colors.grey, // Adjust color as needed
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20), // Adjust margin as needed
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text('دیدگاه خود را شرح دهید',style:
                    TextStyle(
                      fontSize: 15,
                      color: Colors.black
                    ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text('عنوان نظر',style:
                    TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height:size.height*.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:Theme(
                    data: ThemeData(
                      textSelectionTheme: const TextSelectionThemeData(
                        selectionColor: Colors.blue,
                      ),
                    ),
                    child:  TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFf0f0f1),
                      ),
                      onChanged: (value)=>_updateFieldValue('Commenttitle', value),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text('نقاط قوت',style:
                    TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height:size.height*.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:Theme(
                    data: ThemeData(
                      textSelectionTheme: const TextSelectionThemeData(
                        selectionColor: Colors.blue,
                      ),
                    ),
                    child: Stack(
                      children: [
                         TextField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFf0f0f1),
                          ),
                          onChanged: (value)=>_updateFieldValue('positive',value),
                        ),
                        Positioned(
                          left: 0,
                            child:
                        TextButton(
                          onPressed: (){
                           setState(() {
                             _updateFieldlistmappositive(formData['positive']);
                             _textFieldControllers.add(TextEditingController());
                           });
                          },
                          child: Icon(Icons.add),
                        ))
                      ],
                    )

                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _textFieldControllers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _textFieldControllers[index],
                      decoration: InputDecoration(
                        labelText: listmappositive[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text('نقاط ضعیف',style:
                  TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height:size.height*.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:Theme(
                      data: ThemeData(
                        textSelectionTheme: const TextSelectionThemeData(
                          selectionColor: Colors.blue,
                        ),
                      ),
                      child: Stack(
                        children: [
                           TextField(
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFf0f0f1),
                            ),
                            onChanged: (value)=>_updateFieldValue('Negative', value),
                          ),
                          Positioned(
                              left: 0,
                              child:
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    _updateFieldlistmapNegative(formData['Negative']);
                                    _textFieldNegativeControllers.add(TextEditingController());
                                  });
                                },
                                child: Icon(Icons.add),
                              ))
                        ],
                      )

                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _textFieldNegativeControllers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _textFieldControllers[index],
                      decoration: InputDecoration(
                        labelText: listmapNegative[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'متن مورد نظر',
                      fillColor: Color(0xFFf0f0f1)// Or other label text
                    ),
                    maxLines: 3, // Adjust as needed for comment length
                    onChanged: (value)=>_updateFieldValue('Commenttext', value)
                  ),
                ),
                SizedBox(
                  height: size.height*.1,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: BlocListener<RemoteUserpointBloc,RemoteUserpointState>(
                    listener: (context,state){
                      if(state is RemoteUserpointAddDone)
                        {
                          final snackBar = SnackBar(
                            content: Text('Success!'),
                          );
                          ScaffoldMessenger.of(contextscafold).showSnackBar(snackBar);

                        }
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        backgroundColor: Colors.white
                      ),
                      onPressed: (){
                        setState(() {
                          var mypointofview=PointofviewEntity(Score:double.parse(formData['Score']),Commenttitle: formData['Commenttitle'],Positivepoints:listmappositive,Negativepoints: listmapNegative,Commenttext: formData['Commenttext'] );
                          var myproduct=ProductEntity(id: data!.id!);
                          var myuserpoint=UserpointEntity(Productid: myproduct,Pointofviewid: mypointofview,Userid: Userid);
                          myuserbloc.add(GetRemoteuserpointAddEvent(myuserpoint));
                        });
                      },
                        child:
                    const Text('ثبت دیدگاه',style:
                      TextStyle(
                        fontSize: 17,
                        color: Colors.grey
                      ),
                    ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}