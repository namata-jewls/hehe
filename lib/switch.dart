import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchWidget extends StatefulWidget {
  final Function callback;
  bool _yes;
  SwitchWidget(this._yes, this.callback,{super.key});

  static void reset(SwitchWidget sw){
      sw._yes = false;
  }

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  // value of the switch widget

  @override
  Widget build(BuildContext context) {
    // change value of switch everytime it is toggled
    return Switch(
      value: widget._yes,
      activeColor: Colors.deepPurple,
      onChanged: (value){
        setState(() {
          widget._yes = value;
        });
        widget.callback(widget._yes);
      },
    );
  }
}