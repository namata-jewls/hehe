import 'package:flutter/material.dart';

class NumInput extends StatefulWidget {
  final Function callback;
  final String label;
  final String hint;
  const NumInput(this.callback, this.label, this.hint, {super.key});

  @override
  State<NumInput> createState() => _NumInputState();
}

class _NumInputState extends State<NumInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          // use textformfield for num input
          TextFormField(
            validator: (val){
              if (val == null || val.isEmpty) return "Enter age";
              // validate if text is numeric
              final num = int.tryParse(val);
              if (num == null) return "Enter a valid age";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: widget.label,
                hintText: widget.hint),
            onSaved: (value){
              widget.callback(int.tryParse(value!));
            }
          ),
        ],
      ),
    );
  }
}
