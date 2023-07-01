import 'package:flutter/material.dart';

class PaymentCardDetailForm extends StatefulWidget {
  @override
  _PaymentCardDetailFormState createState() => _PaymentCardDetailFormState();
}

class _PaymentCardDetailFormState extends State<PaymentCardDetailForm> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter Payment Card Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: cardNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: expiryDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: cvvController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement the logic to process the payment here
              // You can access the entered card details using the controllers
              String cardNumber = cardNumberController.text;
              String expiryDate = expiryDateController.text;
              String cvv = cvvController.text;

              // Process the payment using the entered details
              // You can call an API or use any payment processing library here

              // After processing the payment, you can close the bottom sheet or navigate to a new screen
              Navigator.pop(context); // Close the bottom sheet after processing the payment
            },
            child: Text('Submit Payment'),
          ),
        ],
      ),
    );
  }
}
