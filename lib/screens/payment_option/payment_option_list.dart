import 'package:flutter/material.dart';

class PaymentOptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Option List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top container with image, title, description
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/detail_course_cover.jpg', // Replace with your image asset
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Course Title',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'This is the description of the course, giving details about what the course offers.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Debit and Credit Card options
              Text(
                'Debit/Credit Card Payment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CardOptions(
                options: ['Visa', 'Mastercard', 'Amex'],
              ),
              SizedBox(height: 16),

              // SSL Commerz supported options
              Text(
                'SSL Commerz Options',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CardOptions(
                options: ['Bkash', 'Nagad', 'Rocket'],
              ),
              SizedBox(height: 16),

              // Terms and Conditions and Save Card
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('I accept Terms and Conditions'),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('Save card for future payments'),
                ],
              ),
              SizedBox(height: 16),

              // Payment details
              Text(
                'Payment Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              PaymentDetailRow(label: 'Course Price', amount: 'BDT 5000'),
              PaymentDetailRow(label: 'Materials Price', amount: 'BDT 1000'),
              PaymentDetailRow(label: 'Discount', amount: '-BDT 500'),
              PaymentDetailRow(label: 'Total', amount: 'BDT 5500', isBold: true),
              SizedBox(height: 26),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add submit functionality here
                  },
                  child: Text('Submit Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardOptions extends StatelessWidget {
  final List<String> options;

  CardOptions({required this.options});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: options
          .map((option) => Chip(
        label: Text(option),
        avatar: Icon(Icons.credit_card),
      ))
          .toList(),
    );
  }
}

class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;

  PaymentDetailRow({required this.label, required this.amount, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            amount,
            style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
