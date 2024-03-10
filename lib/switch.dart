import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final Function callback;
  const SwitchWidget(this.callback, {super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  // value of the switch widget
  bool _yes = false;

  @override
  Widget build(BuildContext context) {
    // change value of switch everytime it is toggled
    return Switch(
      value: _yes,
      activeColor: Colors.deepPurple,
      onChanged: (value){
        setState(() {
          _yes = value;
        });
        widget.callback(_yes);
      },
    );
  }
}
