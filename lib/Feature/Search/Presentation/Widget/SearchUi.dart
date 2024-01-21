

import 'package:digikalaapp/Feature/Search/Presentation/Bloc/remote/Remote_searchProduct_Bloc.dart';
import 'package:digikalaapp/Feature/Search/Presentation/Bloc/remote/Remote_searchProduct_Event.dart';
import 'package:digikalaapp/Feature/Search/Presentation/Bloc/remote/Remote_searchProduct_State.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class SearchUi extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:searchBar() ,
    );
  }
}
class searchBar extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return searchBarstate();
  }
}
class searchBarstate extends State<searchBar>
{
  RemotesearchProductBloc yourBloc = s1<RemotesearchProductBloc>();
  late GetsearchProductEvent _event;
  void initState() {
    super.initState();
    _event = GetsearchProductEvent('');
  }
  Future<void> _onTextChanged(String text) async {
    setState(() {
      // Update the event object with the new text value
      _event.name = text;
    });

    // Dispatch the event to the Bloc
     yourBloc.add(_event);
  }
  String ? text;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    // TODO: implement build
    return MaterialApp(
      home: BlocProvider(
        create: (_)=>yourBloc,
        child: Column(
          children: [
            SizedBox(
              height: size.height*.025,
            ),

            TextField(
              onChanged: (text) =>_onTextChanged(text),
            ),
            SizedBox(
              height: size.height*.01,
            ),

           BlocBuilder<RemotesearchProductBloc,RemotesearchProductState>
              (
                builder: (context,state)
                    {
                      if(state is RemotesearchProductLoading)
                        {
                          return CircularProgressIndicator();
                        }
                      if(state is RemotesearchProductDone)
                        {

                          return SizedBox(
                            height: size.height*.09,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.product!.length!,
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index)
                                {
                                  return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Card(
                                      child: SizedBox(
                                        width: size.width*.69,
                                        child: ListTile(
                                          subtitle:Text(state!.product![index].name!,style:
                                            const TextStyle(
                                              fontSize: 12
                                            ),
                                            softWrap: true,
                                            maxLines: 2, // Set the maximum number of lines to 2
                                            overflow: TextOverflow.ellipsis,) ,
                                          leading: SizedBox(
                                              width: size.width*.2,
                                              child: Image.network(state.product![index].mainpictureUrlID!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          );

                        }
                      return Container();
                    }
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}