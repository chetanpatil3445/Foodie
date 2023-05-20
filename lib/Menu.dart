import 'package:flutter/material.dart';
import 'package:foodie/home.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'card1.dart';
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _selectedFilter = 'All';
  List<String> _filterOptions = ['All', 'Option 1', 'Option 2', 'Option 3'];
  bool _isLiked = false;
  bool _fillAllLikes = false;


  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });

  }
  void _toggleFillAllLikes() {
    setState(() {
      _fillAllLikes = !_fillAllLikes;
      if (_fillAllLikes) {
        _isLiked = false;
      }
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        splashColor: Colors.black,
                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => home()));},
                        child: Container(
                          width: 70,
                          height: 31,
                          color: Colors.red,
                          child: Center(child: Text("Restaurants")),),
                      ),
                      SizedBox(),
                      InkWell(
                        splashColor: Colors.black,
                        onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => home()));},
                        child: Container(
                          width: 70,
                          height: 31,
                          color: Colors.white,
                          child: Center(child: Text("Dishes")),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 75,
                      height: 35,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(children: const [
                          Text("sort"),
                          Icon(Icons.arrow_drop_down_sharp),
                        ],),
                      ),
                    ),

                    Container(
                      width: 87,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("Nearest")),
                    ),

                    Container( width: 87,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("Great Offers")),
                    ),

                    Container( width: 75,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("Rating 4.0+")),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Image.asset("asset/images/Line7.png"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(MyRoutes.homeRoute);
                      },
                      child: Image.asset("asset/images/Group41.png")),
                  Image.asset("asset/images/Group45.png"),
                  Image.asset("asset/images/Group44.png"),
                  Image.asset("asset/images/Group43.png"),
                  Image.asset("asset/images/Group42.png"),
                ],
              ),

              SizedBox(height: 20),
              Container(
                child: Image.asset("asset/images/Line7.png"),
              ),

              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Card1()));
                },
                child: Container(
                  //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                   color: Colors.white,
                  child: Stack(
                    children: [
                      Image.asset("asset/images/Group60.png"),
                      Positioned(
                        bottom: 90,
                        left: 20,
                        child: Text("Hotel name\nChiken Dam Biryani",
                        // textAlign: TextAlign.values.last,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        right: 20,
                        width: 47,
                        height: 25,
                        child: Image.asset("asset/images/Group62.png"),
                      ),
                      Positioned(
                        top: 5,
                        child:  IconButton(color: Colors.white,
                          icon: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border ,
                            color: _isLiked ? Colors.red : null,
                          ),
                          onPressed: _toggleLike,
                        ),),
                      Positioned(
                        top: 170,
                        left: 10,
                        child: Image.asset("asset/images/Group55.png"),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
              Container(
                height: 142,
                width: 322,
                child: Stack(
                  children: [
                    Image.asset("asset/images/istockphoto-1305452646-170667a1.png"),
                    Positioned(
                      top: 5,
                      child:  IconButton(color: Colors.white,
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border ,
                          color: _isLiked ? Colors.red : null,
                        ),
                        onPressed: _toggleLike,
                      ),),
                  ],
                ),
              ),

              SizedBox(height: 30),
              Container(
                child: Stack(
                  children: [
                    Image.asset("asset/images/Rectangle9.png"),
                    Positioned(
                      top: 5,
                      child:  IconButton(color: Colors.white,
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border ,
                          color: _isLiked ? Colors.red : null,
                        ),
                        onPressed: _toggleLike,
                      ),),
                  ],
                ),
              ),

              SizedBox(height: 30),
              Container(
                //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.white,
                child: Stack(
                  children: [
                    Image.asset("asset/images/Group60.png"),
                    Positioned(
                      bottom: 90,
                      left: 20,
                      child: Text("Hotel name\nChiken Dam Biryani",
                        // textAlign: TextAlign.values.last,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 20,
                      width: 47,
                      height: 25,
                      child: Image.asset("asset/images/Group62.png"),
                    ),
                    Positioned(
                      top: 5,
                      child:  IconButton(color: Colors.white,
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border ,
                          color: _isLiked ? Colors.red : null,
                        ),
                        onPressed: _toggleLike,
                      ),),
                    Positioned(
                      top: 170,
                      left: 10,
                      child: Image.asset("asset/images/Group55.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

