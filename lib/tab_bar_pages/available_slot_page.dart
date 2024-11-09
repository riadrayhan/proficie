import 'package:flutter/material.dart';

class AvailableSlotPage extends StatefulWidget {
  const AvailableSlotPage({super.key});

  @override
  State<AvailableSlotPage> createState() => _AvailableSlotPageState();
}

class _AvailableSlotPageState extends State<AvailableSlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Available Slot Open",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2), content: Text("data")));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.deepOrange,
                      child: Center(child: Text("4:00 PM")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text("data")));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.lightGreen,
                      child: Center(child: Text("4:00 PM")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text("data")));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.deepOrange,
                      child: Center(child: Text("4:00 PM")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text("data")));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.lightGreen,
                      child: Center(child: Text("4:00 PM")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text("data")));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.deepOrange,
                      child: Center(child: Text("4:00 PM")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text("data")));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.lightGreen,
                      child: Center(child: Text("4:00 PM")),
                    ),
                  ),
                ],
              ),
                const SizedBox(
                  height: 10,
                ),
              Card(
                elevation: 5,
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width/1.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft, child: Text("City: Kawran Bazar")),
                        Align(alignment: Alignment.centerLeft, child: Text("Street:12 no road,house no 133")),
                        Align(alignment: Alignment.centerLeft, child: Text("State: Dhaka")),
                        Align(alignment: Alignment.centerLeft, child: Text("Phone Number: +8801615-573020")),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
