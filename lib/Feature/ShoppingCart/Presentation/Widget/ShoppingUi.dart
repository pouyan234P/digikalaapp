import 'package:flutter/material.dart';

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

class BodyShoppingUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height*.033),
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
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 30,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Size mysize=MediaQuery.of(context).size;
                          return
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width: mysize.width,
                                  height: mysize.height*.15,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 0,
                                          right: 20,
                                          child: Image.asset('assets/images/mainpicture.jpg',width: mysize.width*.20),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                          right: 20,
                                          child:
                                          Row(
                                            children: [
                                              GestureDetector(

                                                  onTap: () {}, child:
                                              const Icon(Icons.add),
                                              ),
                                              const Column(
                                                children: [
                                                  Text("1",style:
                                                  TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black
                                                  ),
                                                  ),
                                                  Text("حداکتر",style:
                                                  TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black
                                                  ),)
                                                ],
                                              ),
                                              const Icon(Icons.delete)
                                            ],
                                          ),

                                      ),
                                      Positioned(
                                        top: 0,
                                          left: 50,
                                          child:
                                          SizedBox(
                                            width: mysize.width*.5,
                                            child: Column(
                                              children: [
                                                const Text("گوشی موبایل اپل مدل iPhone 13 CH دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت - نات اکتیو",style:
                                                TextStyle(
                                                    fontSize: 12
                                                ),
                                                  softWrap: true,
                                                  maxLines: 2,// Set the maximum number of lines to 2
                                                ),
                                                Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundColor: Colors.green,
                                                      radius: 10.0,
                                                    ),
                                                    SizedBox(
                                                      width: mysize.width*.04,
                                                    ),
                                                    const Text("سبز تیره",style:
                                                    TextStyle(
                                                        fontSize: 12
                                                    ),)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.check_circle_outlined),
                                                    SizedBox(
                                                      width: mysize.width*.04,
                                                    ),
                                                    const Text("کارانتی 18 ماهه راشا مهر نیکان",style:
                                                    TextStyle(
                                                        fontSize: 12
                                                    ),)
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 20),
                                                  child: Row(
                                                    children: [
                                                      const Text("7,350,000",style:
                                                        TextStyle(
                                                          fontSize: 12
                                                        ),),
                                                      SizedBox(
                                                        width: mysize.width*.025,
                                                      ),
                                                      const Text("تومان",style:
                                                        TextStyle(
                                                          fontSize: 12
                                                        ),)
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
                            /*ListTile(

                              leading:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Image.asset('assets/images/mainpicture.jpg'),
                                    ],
                                  ),

                              title:  Column(
                                children: [
                                  const Text("گوشی موبایل اپل مدل iPhone 13 CH دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت - نات اکتیو",style:
                                  TextStyle(
                                      fontSize: 12
                                  ),
                                    softWrap: true, // Set the maximum number of lines to 2
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 10.0,
                                      ),
                                      SizedBox(
                                        width: size.width*.04,
                                      ),
                                      const Text("سبز تیره",style:
                                      TextStyle(
                                          fontSize: 12
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.check_circle_outlined),
                                      SizedBox(
                                        width: size.width*.04,
                                      ),
                                      const Text("کارانتی 18 ماهه راشا مهر نیکان",style:
                                      TextStyle(
                                          fontSize: 12
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  const Text("7,350,000"),
                                  SizedBox(
                                    width: size.width*.025,
                                  ),
                                  const Text("تومان")
                                ],
                              ),

                            );*/
                        },
                      ),
                      Container(
                        height: size.height*.02,
                        color: Colors.grey,
                      ),
                       Column(
                        children: [
                          Row(
                            children: [
                              const Text("خلاصه سبد",style:
                                TextStyle(
                                  fontSize: 12
                                ),
                              ),
                              SizedBox(
                                width: size.width*.75,
                              ),
                              const Text("2",style:
                                TextStyle(
                                  fontSize: 12
                                ),),
                              const Text("کالا",style:
                                TextStyle(
                                  fontSize: 12
                                ),)
                            ],
                          ),
                          Row(
                            children: [
                              const Text("قیمت کالا",style:
                              TextStyle(
                                  fontSize: 12
                              ),
                              ),
                              SizedBox(
                                width: size.width*.65,
                              ),
                              const Text("7,350,000",style:
                              TextStyle(
                                  fontSize: 12
                              ),),
                              const Text("تومان",style:
                              TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              const Text("تخفیف کالاها",style:
                              TextStyle(
                                  fontSize: 12
                              ),
                              ),
                              SizedBox(
                                width: size.width*.62,
                              ),
                              const Text("1,620,000",style:
                              TextStyle(
                                  fontSize: 12
                              ),),
                              const Text("تومان",style:
                              TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              const Text("جمع سبد کالا",style:
                              TextStyle(
                                  fontSize: 12
                              ),
                              ),
                              SizedBox(
                                width: size.width*.61,
                              ),
                              const Text("5,730,000",style:
                              TextStyle(
                                  fontSize: 12
                              ),),
                              const Text("تومان",style:
                              TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height*.07,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child:   Container(
                  color: Colors.white,
                  width: size.width * 1,
                  height: size.height * 0.07,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 0,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                Text(
                                  "جمع سبد خرید",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "35,350,000",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
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
          )

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}