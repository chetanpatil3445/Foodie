import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:get/get.dart';


class getstart extends StatefulWidget {
  const getstart({Key? key}) : super(key: key);

  @override
  State<getstart> createState() => _getstartState();
}

class _getstartState extends State<getstart> {
  bool isfinished = false;
  @override
  Widget build(BuildContext context) {
    return

         SafeArea(
           child: Column(
            children: [
              Container(
                height: 800,
                child: Stack(
                  children: [
                    Image.asset("asset/images/GetStart.png", fit: BoxFit.fill,),
                   SwipeableButtonView(
                     activeColor: Colors.red,
                     onFinish: () => Get..toNamed(MyRoutes.homeRoute),
                     onWaitingProcess: () {
                       Future.delayed(Duration(seconds: 2), () {
                         setState(() {
                           isfinished = true;
                         });
                       });
                     },
                     isFinished: isfinished,
                     buttonText:" Get started",
                    buttonWidget: Container(
                     child: Icon(Icons.arrow_forward_ios_rounded,
                     color: Colors.cyan,

                     ),
                   ),
                   )


                   /* Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset("asset/images/Ellipse 1.png", fit: BoxFit.fill,
                        
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
           ),
         );


  }
}
