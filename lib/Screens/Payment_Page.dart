import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Options')),
      body: Column(
        children: [Container(height: 250,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("asset/images/logopgp.jpeg"),),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(
                   color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {

                        // Implement PhonePe payment logic here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       // mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("asset/images/phonepe.jpg", height: 50,width: 80,fit: BoxFit.fill,),
                          SizedBox(width: 10),
                          Text('PhonePe'),
                          Text('pay'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement Google Pay payment logic here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("asset/images/gpay.jpeg", height: 50, width: 80, fit:BoxFit.fill,),
                          SizedBox(width: 10),
                          Text('Google Pay'),
                          Text(' Pay'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement Debit/Credit Card payment logic here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("asset/images/cards.jpeg", height: 50),
                          SizedBox(width: 10),
                          Text('Debit/Credit Card'),
                          Text('pay'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
