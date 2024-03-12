import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SuperpowerDropdown extends StatefulWidget {
  final Function callback;
  // list of choices for dropdown
  static final List<String> _dropdownOptions = [
    "Makalipad",
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya"
  ];

  // value selected
  String _dropdownValue = _dropdownOptions.first;

  SuperpowerDropdown(this.callback, {super.key});

 static void reset(SuperpowerDropdown sd){
    sd._dropdownValue = _dropdownOptions.first;
 }

  @override
  State<SuperpowerDropdown> createState() => _SuperpowerDropdownState();
}

class _SuperpowerDropdownState extends State<SuperpowerDropdown> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Superpower dropdown
          const Text("Superpower", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("If you were to have a superpower, what would you choose?", style: TextStyle(fontSize: 15)),
          DropdownButtonFormField<String>(
            value: widget._dropdownValue,
            items: SuperpowerDropdown._dropdownOptions.map((superpower) {
            return DropdownMenuItem<String>(
                child: Text(superpower),
                value: superpower,
              );
            }).toList(),
            onChanged: (val) {
              // set new value when changed
              setState(() {
                widget._dropdownValue = val!;
              });
              widget.callback(widget._dropdownValue);
            }
          )
        ]
      )
    );
  }
}
