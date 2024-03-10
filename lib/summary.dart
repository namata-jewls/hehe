import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  // initializes the value of each form widget or field
  final String _name;
  final String _nickname;
  final int _age;
  final bool _inRelationship;
  final double _happinessLevel;
  final String _superpower;
  final String _motto;

  const Summary(this._name, this._nickname, this._age, this._inRelationship, this._happinessLevel, this._superpower, this._motto, {super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // Each Row widget contains a pair of field:value for each field in the form
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Name", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._name))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Nickname", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._nickname))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Age", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._age.toString()))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("In Relationship", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._inRelationship ? "Yes" : "No"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Happiness", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._happinessLevel.toString()))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Super Power", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._superpower))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Motto", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget._motto))
            ],
          )
        ],
      )
    );
  }
}
