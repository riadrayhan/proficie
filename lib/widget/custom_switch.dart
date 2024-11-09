import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

Widget customSwitch() {
  return Container(
    alignment: Alignment.center,
    height: 40,
    width: 150,
    child: ToggleSwitch(
      cornerRadius: 50,
      activeBgColors: const [
        [Colors.red],
        [Colors.green]
      ],
      // activeFgColor: Colors.white,
      // inactiveBgColor: Color(0xff2E8F0),
      minWidth: 50,
      inactiveBgColor: Colors.grey.shade300,
      inactiveFgColor: Colors.green,
      initialLabelIndex: 1,
      totalSwitches: 2,
      iconSize: 20,
      icons: const [
        FontAwesomeIcons.faceGrinWide,
        FontAwesomeIcons.faceGrinWide,
      ],
      radiusStyle: true,
      onToggle: (index) {

      },
    ),
  );
}
