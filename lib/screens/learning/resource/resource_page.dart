import 'package:flutter/material.dart';
import 'package:proficie/screens/learning/resource/certificate.dart';
import 'package:proficie/screens/learning/resource/quiz.dart';
import 'package:proficie/screens/learning/resource/schedule.dart';
import 'package:proficie/screens/learning/resource/syllabus.dart';

class Resource extends StatefulWidget {
  const Resource({super.key});

  @override
  State<Resource> createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" 4 Resources"),
        backgroundColor: Colors.white38,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Card(
            shadowColor: Color(0xFF39C7B6),
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Syllabus(),));
                });
              },
              title: Text("Syllabus"),
              leading: Icon(Icons.newspaper,color: Colors.lightBlueAccent[100],),
            ),
          ),
          Card(
            shadowColor: Color(0xFF39C7B6),
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Schedule(),));
                });
              },
              title: Text("Schedule"),
              leading: Icon(Icons.schedule,color: Colors.lightBlueAccent[100],),
            ),
          ),
          Card(
            shadowColor: Color(0xFF39C7B6),
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Certificate(),));
                });
              },
              title: Text("Certificate"),
              leading: Icon(Icons.sticky_note_2_rounded,color: Colors.lightBlueAccent[100],),
            ),
          ),
          Card(
            shadowColor: Color(0xFF39C7B6),
            child: ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Quiz(),));
                });
              },
              title: Text("Quiz"),
              leading: Icon(Icons.quiz,color: Colors.lightBlueAccent[100],),
            ),
          ),
        ],
      ),
    );
  }
}
