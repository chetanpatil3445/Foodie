import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'home.dart';
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

         Container(
             color: Color(0xFFFF0000),
           child: Column(
            children: [
              Expanded(
                child: Container(
                  // height: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset("asset/images/Get1Start.png", fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
                    /* Positioned(
                      // bottom: 20,
                       child: SwipeableButtonView(
                         activeColor: Colors.white,
                         onFinish: () async {
                           await Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                         },
                         onWaitingProcess: () {
                           Future.delayed(const Duration(seconds: 2), () {
                             setState(() {
                               isfinished = true;
                             });
                           });
                         },
                         isFinished: isfinished,
                         buttonText:" Get started",
                         buttontextstyle: const TextStyle(
                           color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900 ,),
                         buttonColor: Colors.black,
                        buttonWidget: Container(
                         child: Icon(Icons.arrow_forward_ios_rounded,
                         color: Colors.cyan,),
                       ),
                       ),
                     )*/
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  height: 61,
                  width: double.infinity,
                  child:    SwipeableButtonView(
                    activeColor: Colors.white,
                    onFinish: () async {
                      await Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                    },
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 0), () {
                        setState(() {
                          isfinished = true;
                        });
                      });
                    },
                    isFinished: isfinished,
                    buttonText:"Get Starated",
                    disableColor: Colors.white,
                    buttontextstyle: const TextStyle(
                      color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900 ,
                    decoration: TextDecoration.none),
                    buttonColor: Colors.black,
                   buttonWidget: Container(
                    child: Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.red,),
                  ),
                  ),
                ),
              ),
              Container(
                color: Color(0xFFFF0000),
                height: 40,)
            ],
           ),
         );


  }
}
