import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PaymentCardDetailForm.dart';

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

                        // Launch PhonePe app using url_launcher
                        launch("https://www.phonepe.com/"); // Replace this URL with the appropriate PhonePe URL to open their app or website.

                        // Note: If the user doesn't have the PhonePe app installed, the website will open instead.
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("asset/images/phonepe.jpg", height: 50, width: 80, fit: BoxFit.fill,),
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
                        // Show the bottom sheet when the button is pressed
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return PaymentCardDetailForm(); // Replace PaymentCardDetailForm with your actual payment form widget
                          },
                        );
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
