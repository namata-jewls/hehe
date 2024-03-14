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

  void reset(){
    setState(() {
      _name = "";
      _nickname = "";
      _age = 0;
      _inRelationship = false;
      _happinessLevel = 1;
      _superpower = "Makalipad";
      _motto = Mottos.hate.mottoString;
    });
  }

  late SwitchWidget sw;
  late HappySlider hs;
  late SuperpowerDropdown sd;
  late Motto motto;

  // boolean that is used for showing summary
  bool _showSummary = false;

  @override
  Widget build(BuildContext context) {
    // initialize the widgets to be used
    sw = SwitchWidget((bool val) => _inRelationship = val);
    hs = HappySlider((double val) => _happinessLevel = val);
    sd = SuperpowerDropdown((String val) => _superpower = val);
    motto = Motto((String val) => _motto = val);
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
                  child: const Text("In a Relationship?", style: TextStyle(fontSize: 17))
                ),
                sw
              ]
            ),
            // Slider, Dropdown, and Radio Buttons
            hs,
            sd,
            motto,
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
                      _formKey.currentState!.reset();
                      sw = SwitchWidget((bool val) => _inRelationship = val);
                      hs = HappySlider((double val) => _happinessLevel = val);
                      sd = SuperpowerDropdown((String val) => _superpower = val);
                      motto = Motto((String val) => _motto = val);
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
                    _formKey.currentState!.reset();
                    setState(() {
                      reset();
                      SwitchWidget.reset(sw);
                      HappySlider.reset(hs);
                      SuperpowerDropdown.reset(sd);
                      Motto.reset(motto);
                      _showSummary = false;
                    });
                },
              )
            )
          ],
        )
      )
    );
  }
}