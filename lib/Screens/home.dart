import 'dart:async';
import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Screens/profile_Page.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import '../MenuScreens/Biryani_Menu.dart';
import '../MenuScreens/BurgerMenu.dart';
import '../MenuScreens/PastaMenu.dart';
import '../MenuScreens/PizzaMenu.dart';
import '../MenuScreens/RollMenu.dart';
import '../MenuScreens/SandwichMenu.dart';
import 'MapScreen.dart';
import 'Menu.dart';
import 'package:http/http.dart' as http;
import '../Widgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'UserProfilePage.dart';
import 'cart_screen.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 2;
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  String selectedLocation = 'nashik Road';
  bool _isExpanded = false;
   final List<String> assetImagePaths = [
    'asset/images/offer1.jpeg',
    'asset/images/offer2.jpeg',
    'asset/images/offer3.jpeg',
    'asset/images/offer4.jpeg',


    // Add more asset image paths as needed
  ];
   @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // Prevent back button from going back to GetStart page
      return false;
    }, child : Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Color(0xFFEEEEEE),
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(
                    selectedLocation: selectedLocation,
                    markers: _markers,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Text(selectedLocation, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 280,
                      height: 45,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // border: Border.all()
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              icon: new Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: "Search your favourite food"
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30),),
                      // border: Border.all()
                    ),

                    child: TextField(
                      decoration: InputDecoration(
                        iconColor: Colors.red,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.filter_list),
                          onPressed: () {},),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      color: Colors.white,
                      child: HorizontalSliderContainer(assetImagePaths: assetImagePaths),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? "View Less" : "View All",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            // The InkWell wrapped around the Image and Text widgets
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PizzaMenu()),
                                );
                              },
                              child: Image.asset('asset/images/pizza.png', height: 100),
                            ),
                            Text(
                              "Pizza",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            // The InkWell wrapped around the Image and Text widgets
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BiryaniMenu()),
                                );
                              },
                              child: Image.asset('asset/images/biryani5.png', height: 100),
                            ),
                            Text(
                              "Biryani",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            // The InkWell wrapped around the Image and Text widgets
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RollMenu()),
                                );
                              },
                              child: Image.asset('asset/images/roll.png', height: 100),
                            ),
                            Text(
                              "Roll",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),

                      ],
                    ),
                    if (_isExpanded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Additional items to show when "View All" is tapped
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigate to the respective page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BurgerMenu()),
                                  );
                                },
                                child: Image.asset('asset/images/burger.jpeg', height: 85),
                              ),
                              Text(
                                "Burger",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigate to the respective page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PastaMenu()),
                                  );
                                },
                                child: Image.asset('asset/images/pasta.jpeg', height: 90),
                              ),
                              Text(
                                "Pasta",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigate to the respective page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SandwichMenu()),
                                  );
                                },
                                child: Image.asset('asset/images/sandwich.jpeg', height: 90),
                              ),
                              Text(
                                "Sandwich",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),


                        ],
                      ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular today", style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600,),),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('asset/images/cake.jpeg',),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('asset/images/shake.jpeg',),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('asset/images/pepsi.jpeg',),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('asset/images/icecream.jpeg',),
                ),
              ),


            ],
          ),
        ),
      drawer: DrawerWidget(),
      bottomNavigationBar : CurvedNavigationBar(
          backgroundColor:Colors.transparent,
          index: _currentIndex,
          items: [
            Icon(Icons.person_outline,size: 30),
            Icon(Icons.favorite_outline,size: 30),
            Icon(Icons.home,size: 30,color: Colors.redAccent),
            Icon(Icons.restaurant_menu,size: 30),
            Icon(Icons.shopping_cart,size: 30),
          ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        ),

      ),
    );
  }
}




class HorizontalSliderContainer extends StatefulWidget {
  final List<String> assetImagePaths;

  HorizontalSliderContainer({required this.assetImagePaths});

  @override
  _HorizontalSliderContainerState createState() => _HorizontalSliderContainerState();
}

class _HorizontalSliderContainerState extends State<HorizontalSliderContainer> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is created
    _startAutoScroll();
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _cancelAutoScroll();
    super.dispose();
  }

  void _startAutoScroll() {
    // Set up a timer that calls _scrollToNextPage every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      _scrollToNextPage();
    });
  }

  void _scrollToNextPage() {
    // Calculate the index of the next page
    int nextPageIndex = (_currentPageIndex + 1) % widget.assetImagePaths.length;

    // Scroll to the next page using the PageController
    _pageController.animateToPage(
      nextPageIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    // Update the current page index
    _currentPageIndex = nextPageIndex;
  }

  void _cancelAutoScroll() {
    // Cancel the timer if it's active
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: widget.assetImagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              widget.assetImagePaths[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
