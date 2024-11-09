import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {

  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    const green = Color(0xFF45CC0D);

    return Scaffold(
      appBar: AppBar(
        title: Text("Preference"),
      ),
      body: DefaultTextStyle(
        style: theme.textTheme.titleLarge!,
        textAlign: TextAlign.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: Text("Career"),
                  subtitle: Text("subtitle"),
                  trailing: SizedBox(child: Togglebtn(),),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Skills"),
                  subtitle: Text("subtitle"),
                  trailing: SizedBox(child: Togglebtn2(),),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Jobs"),
                  subtitle: Text("subtitle"),
                  trailing: SizedBox(child: Togglebtn3(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Togglebtn(){
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            // spreadRadius: 1,
            // blurRadius: 2,
            offset: Offset(0, .3),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (b) => setState(() => positive = b),
      styleBuilder: (b) =>
          ToggleStyle(indicatorColor: b ? Colors.red : Colors.green),
      iconBuilder: (value) => value
          ? Icon(Icons.code_off_outlined)
          : Icon(Icons.tag_faces_rounded),
      textBuilder: (value) => value
          ? Center(child: Text('Inactive'))
          : Center(child: Text('Active')),
    );
  }

  Widget Togglebtn2(){
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            // spreadRadius: 1,
            // blurRadius: 2,
            offset: Offset(0, .3),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (b) => setState(() => positive = b),
      styleBuilder: (b) =>
          ToggleStyle(indicatorColor: b ? Colors.red : Colors.green),
      iconBuilder: (value) => value
          ? Icon(Icons.code_off_outlined)
          : Icon(Icons.tag_faces_rounded),
      textBuilder: (value) => value
          ? Center(child: Text('Inactive'))
          : Center(child: Text('Active')),
    );
  }

  Widget Togglebtn3(){
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            // spreadRadius: 1,
            // blurRadius: 2,
            offset: Offset(0, .3),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (b) => setState(() => positive = b),
      styleBuilder: (b) =>
          ToggleStyle(indicatorColor: b ? Colors.red : Colors.green),
      iconBuilder: (value) => value
          ? Icon(Icons.code_off_outlined)
          : Icon(Icons.tag_faces_rounded),
      textBuilder: (value) => value
          ? Center(child: Text('Inactive'))
          : Center(child: Text('Active')),
    );
  }
}
