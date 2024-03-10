import 'package:flutter/material.dart';
import 'package:user_interactive_app/dropdown.dart';
import 'package:user_interactive_app/radio.dart';
import 'package:user_interactive_app/slider.dart';
import 'package:user_interactive_app/textField.dart';
import 'package:user_interactive_app/numInput.dart';
import 'package:user_interactive_app/switch.dart';
import 'package:user_interactive_app/summary.dart';

// This contains all the fields and other form widgets, as well as the save and reset buttons, and summary
class SlambookForm extends StatefulWidget {
  const SlambookForm({super.key});

  @override
  State<SlambookForm> createState() => _SlambookFormState();
}

class _SlambookFormState extends State<SlambookForm> {
  // formkey for validating, saving, and resetting fields
  final _formKey = GlobalKey<FormState>();
  // variables for storing the form values
  String _name = "";
  String _nickname = "";
  int _age = 0;
  bool _inRelationship = false;
  double _happinessLevel = 1;
  String _superpower = "Makalipad";
  String _motto = Mottos.hate.mottoString;

  // boolean that is used for showing summary
  bool _showSummary = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:20, horizontal:5),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text("The Tita Slambook", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            const SizedBox(height: 15),
            // Text Fields
            TextInput((String val) => _name = val, "Name", "Enter name"),
            TextInput((String val) => _nickname = val, "Nickname", "Enter nickname"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  // Num Input field
                  child: NumInput((int val) => _age = val, "Age", "Enter Age")
                ),
                Container(
                  // Switch for inRelationship
                  child: const Text("In a Relationship?", style: TextStyle(fontSize: 17))),
                SwitchWidget((bool val) => _inRelationship = val)
              ]
            ),
            // Slider, Dropdown, and Radio Buttons
            HappySlider((double val) => _happinessLevel = val),
            SuperpowerDropdown((String val) => _superpower = val),
            Motto((String val) => _motto = val),
            // Submit Button
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),             
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green)
                ),
                child: const Text("Save", style: TextStyle(color: Colors.green)),
                onPressed: (){
                  // checks if fields are valid, then saves
                  if(_formKey.currentState != null && _formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    setState(() {
                      _showSummary = true;
                    });
                  }
                },
              )
            ),
            Container(
              // will show the summary depending on the boolean showSummary's value
              margin: const EdgeInsets.only(top:10),
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white54, width: 3))),
              child: _showSummary ? Summary(_name, _nickname, _age, _inRelationship, _happinessLevel, _superpower, _motto) : SizedBox(height:10, width:MediaQuery.of(context).size.width)
            ),
            Container(
              margin: const EdgeInsets.only(top:30, bottom: 20),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red)
                ),
                child: const Text("Reset", style: TextStyle(color: Colors.red)),
                // resets the fields
                onPressed: (){
                  if(_formKey.currentState != null){
                    _formKey.currentState!.reset();
                    setState(() {
                      _showSummary = false;
                    });
                  }
                },
              )
            )
          ],
        )
      )
    );
  }
}