import 'package:flutter/material.dart';

// used for the values in the radio buttons
enum Mottos{
  hate(mottoString:"Haters gonna hate"), 
  bake(mottoString:"Bakers gonna Bake"), 
  borrow(mottoString:"If cannot be, borrow one from three"), 
  less(mottoString:"Less is more, more or less"), 
  sorry(mottoString:"Better late than sorry"), 
  strangers(mottoString:"Don't talk to strangers when your mouth is full"), 
  bridge(mottoString:"Let's burn the bridge when we get there");

  const Mottos({required this.mottoString});
  final String mottoString;
}

// ignore: must_be_immutable
class Motto extends StatefulWidget {
  final Function callback;
  // the group value of the radio buttons
  Mottos _mottoChoice;
  Motto(this._mottoChoice, this.callback, {super.key});

  static void reset(Motto motto){
    motto._mottoChoice = Mottos.hate;
  }

  @override
  State<Motto> createState() => _MottoState();
}

class _MottoState extends State<Motto> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        const Text("Motto", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        // Each radio button is inside a ListTile, and changes the group's value everytime a radio button is click
        ListTile(
          title: Text(Mottos.hate.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.hate,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        ),
        ListTile(
          title: Text(Mottos.bake.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.bake,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        ),
        ListTile(
          title: Text(Mottos.borrow.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.borrow,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        ),
        ListTile(
          title: Text(Mottos.less.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.less,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        ),
        ListTile(
          title: Text(Mottos.sorry.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.sorry,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        ),
        ListTile(
          title: Text(Mottos.strangers.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.strangers,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        ),
        ListTile(
          title: Text(Mottos.bridge.mottoString),
          leading: Radio<Mottos>(
            groupValue: widget._mottoChoice,
            value: Mottos.bridge,
            onChanged: (Mottos? value){
              setState(() {
                widget._mottoChoice = value!;
              });
              widget.callback(widget._mottoChoice);
            },
          ),
        )
      ]
    );
  }
}