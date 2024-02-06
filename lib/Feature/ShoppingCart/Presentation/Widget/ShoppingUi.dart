import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_Bloc.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_Event.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_State.dart';
import 'package:digikalaapp/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 double ?  average;
class ShoppingUi extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ShoppingUiState();
  }
}

class ShoppingUiState extends State<ShoppingUi> {
  @override
  Widget build(BuildContext context) {
    int _index = 0;

    return Scaffold(
      body: BodyShoppingUi(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_rounded),
            label: 'Profile',
            backgroundColor: Colors.white70,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shoppingcart',
            backgroundColor: Colors.white70,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.white70,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white70,
            activeIcon: Icon(Icons.home, size: 55),
          ),
        ],
        onTap: (int index) {
          setState(() {
            switch (index) {
              case 3:
                {
                  Navigator.pushNamed(context, '/');
                  break;
                }
              case 2:
                {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/category');
                  break;
                }
              case 1:
                {
                  // Shopping Basket Page;
                  break;
                }
              case 0:
                {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                }
            }
          });
        },
      ),
    );
  }
}

class BodyShoppingUi extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyShoppingUiState();
  }
}
class BodyShoppingUiState extends State<BodyShoppingUi>
{
  final RemoteShoppingBloc yourbloc = s1<RemoteShoppingBloc>();

  void _updateAverage(List<cartDetailShoppingEntity>? list) {
    double sum = 0;
    for (var item in list!) {
      sum = sum + item.productid!.Price!;
    }
    setState(() {
      average = sum;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    // TODO: implement build
    return
      MaterialApp(
        home: SafeArea(
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocProvider(
                create: (context) => yourbloc,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .033),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "دبگر کالاها",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              BlocBuilder<RemoteShoppingBloc, RemoteShoppingState>(
                                  builder: (context, state) {
                                    if (state is RemoteShoppingLoading) {
                                      yourbloc.add(GetShoppingEvent(Userid,1));
                                      return const CircularProgressIndicator();
                                    }
                                    if (state is RemoteShoppingDone) {
                                      //In this modification,
                                      // I added WidgetsBinding.instance!.addPostFrameCallback to ensure that setState
                                      // is called after the build is complete. This should help in preventing the "setState()
                                      // or markNeedsBuild() called during build" error.
                                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                                        // This ensures that the setState is called after the build is complete
                                        setState(() {
                                          _updateAverage(state.listshoppingcart!);
                                        });
                                      });
                                      return
                                        SizedBox(
                                          width: double.infinity,
                                          child: ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),

                                          itemCount: state.listshoppingcart!.length!,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            Size mysize = MediaQuery.of(context).size;
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: SizedBox(
                                                width: mysize.width,
                                                height: mysize.height * .15,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                        top: 0,
                                                        right: 20,
                                                        child: Image.network(
                                                          (state.listshoppingcart![index]
                                                              .productid?.Picture ??
                                                              ''),
                                                          width: mysize.width * .25,
                                                          height: mysize.height * .1,
                                                          errorBuilder:
                                                              (context, error, stackTrace) {
                                                            if (error
                                                            is NetworkImageLoadException) {
                                                              return Image.asset(
                                                                  'assets/images/placeholder.png');
                                                            } else {
                                                              return const Text(
                                                                'Error loading image',
                                                                style:
                                                                TextStyle(fontSize: 12),
                                                              );
                                                            }
                                                          },
                                                        )),
                                                    Positioned(
                                                      bottom: 0,
                                                      right: 20,
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {},
                                                            child: const Icon(Icons.add),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                state
                                                                    .listshoppingcart![
                                                                index]
                                                                    .Count!
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 12,
                                                                    color: Colors.black),
                                                              ),
                                                              const Text(
                                                                "حداکتر",
                                                                style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: Colors.black),
                                                              )
                                                            ],
                                                          ),
                                                          const Icon(Icons.delete)
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 0,
                                                      left: 50,
                                                      child: SizedBox(
                                                        width: mysize.width * .5,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              state.listshoppingcart![index]
                                                                  .productid!.Name!,
                                                              style: const TextStyle(
                                                                  fontSize: 12),
                                                              softWrap: true,
                                                              maxLines:
                                                              2, // Set the maximum number of lines to 2
                                                            ),
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  backgroundColor: state.listshoppingcart != null &&
                                                                      index <
                                                                          state
                                                                              .listshoppingcart!
                                                                              .length &&
                                                                      state
                                                                          .listshoppingcart?[
                                                                      index]
                                                                          .productid !=
                                                                          null &&
                                                                      state
                                                                          .listshoppingcart![
                                                                      index]
                                                                          .productid!
                                                                          .hashColor !=
                                                                          null
                                                                      ? Color(int.parse(
                                                                      '0xFF${state.listshoppingcart![index].productid!.hashColor}'))
                                                                      : Colors.white,
                                                                  // Provide a default color in case of null
                                                                  radius: 10.0,
                                                                ),
                                                                SizedBox(
                                                                  width: mysize.width * .04,
                                                                ),
                                                                Text(
                                                                  state
                                                                      .listshoppingcart![
                                                                  index]
                                                                      .productid!
                                                                      .Color ??
                                                                      "",
                                                                  style: const TextStyle(
                                                                      fontSize: 12),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Icon(Icons
                                                                    .check_circle_outlined),
                                                                SizedBox(
                                                                  width: mysize.width * .04,
                                                                ),
                                                                const Text(
                                                                  "کارانتی 18 ماهه راشا مهر نیکان",
                                                                  style: TextStyle(
                                                                      fontSize: 12),
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.only(
                                                                  top: 20),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    state
                                                                        .listshoppingcart![
                                                                    index]
                                                                        .productid!
                                                                        .Price!
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        fontSize: 12),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    mysize.width * .025,
                                                                  ),
                                                                  const Text(
                                                                    "تومان",
                                                                    style: TextStyle(
                                                                        fontSize: 12),
                                                                  )
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
                                            );
                                          },
                                                                                ),
                                        );
                                    }
                                    return Container();
                                  }),
                              Container(
                                height: size.height * .02,
                                color: Colors.grey,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "خلاصه سبد",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: size.width * .75,
                                      ),
                                      const Text(
                                        "2",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const Text(
                                        "کالا",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "قیمت کالا",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: size.width * .65,
                                      ),
                                      const Text(
                                        "7,350,000",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const Text(
                                        "تومان",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "تخفیف کالاها",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: size.width * .62,
                                      ),
                                      const Text(
                                        "1,620,000",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const Text(
                                        "تومان",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "جمع سبد کالا",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: size.width * .61,
                                      ),
                                      const Text(
                                        "5,730,000",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const Text(
                                        "تومان",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * .07,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.white,
                        width: size.width * 1,
                        height: size.height * 0.07,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    children: [
                                      const Text(
                                        "جمع سبد خرید",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            average.toString(),
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const Text(
                                            "تومان",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: const Text(
                                    "ادامه فرایند خرید",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        debugShowCheckedModeBanner: false,
      );
  }

}
