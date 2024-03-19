import 'package:exer5_app/drawer.dart';
import 'package:exer5_app/main.dart';
import 'package:exer5_app/summaryData.dart';
import 'package:flutter/material.dart';
import 'package:exer5_app/dropdown.dart';
import 'package:exer5_app/radio.dart';
import 'package:exer5_app/slider.dart';
import 'package:exer5_app/textField.dart';
import 'package:exer5_app/numInput.dart';
import 'package:exer5_app/switch.dart';
import 'package:exer5_app/summary.dart';

// This contains all the fields and other form widgets, as well as the save and reset buttons, and summary
class SlambookForm extends StatefulWidget {
  const SlambookForm({super.key});

  @override
  State<SlambookForm> createState() => _SlambookFormState();
}

class _SlambookFormState extends State<SlambookForm> {
  // formkey for validating, saving, and resetting fields
  final _formKey = GlobalKey<FormState>();
  //List<SummaryData> _summaries = InteractiveApp.summaryData;
  // variables for storing the form values
  String _name = "";
  String _nickname = "";
  int _age = 0;
  bool _inRelationship = false;
  double _happinessLevel = 1;
  String _superpower = "Makalipad";
  Mottos _motto = Mottos.hate;

  void reset(){
    setState(() {
      _name = "";
      _nickname = "";
      _age = 0;
      _inRelationship = false;
      _happinessLevel = 1;
      _superpower = "Makalipad";
      _motto = Mottos.hate;
    });
  }

  late SwitchWidget switchWidget;
  late HappySlider happySlider;
  late SuperpowerDropdown superpowerDropdown;
  late Motto motto;

  // boolean that is used for showing summary
  bool _showSummary = false;

  @override
  Widget build(BuildContext context) {
    // initialize the widgets to be used
    switchWidget = SwitchWidget(_inRelationship, (bool val) => _inRelationship = val);
    happySlider = HappySlider(_happinessLevel, (double val) => _happinessLevel = val);
    superpowerDropdown = SuperpowerDropdown(_superpower, (String val) => _superpower = val);
    motto = Motto(_motto, (Mottos val) => _motto = val);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slambook"),
      ),
      drawer: DrawerWidget(summaries: InteractiveApp.summaryData),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical:20, horizontal:5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("My Friends' Slambook", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
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
                    switchWidget
                  ]
                ),
                // Slider, Dropdown, and Radio Buttons
                happySlider,
                superpowerDropdown,
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
                          SummaryData sd = SummaryData(_name, _nickname, _age, _inRelationship, _happinessLevel, _superpower, _motto.mottoString);
                          InteractiveApp.summaryData.add(sd);
                          print(InteractiveApp.summaryData);
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
                  child: _showSummary ? Summary(_name, _nickname, _age, _inRelationship, _happinessLevel, _superpower, _motto.mottoString) : SizedBox(height:10, width:MediaQuery.of(context).size.width)
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
                          SwitchWidget.reset(switchWidget);
                          HappySlider.reset(happySlider);
                          SuperpowerDropdown.reset(superpowerDropdown);
                          Motto.reset(motto);
                          _showSummary = false;
                        });
                    },
                  )
                )
              ],
            )
          )
        )
      )
    );
  }
}