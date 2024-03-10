import 'package:flutter/material.dart';

// A class for all text input
class TextInput extends StatefulWidget {
  final Function callback;
  // has unique label and hint text
  final String _label;
  final String _hint;
  const TextInput(this.callback, this._label, this._hint, {super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            validator: (val){
              // checks if input is valid
              if (val == null || val.isEmpty) return "Enter a text";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: widget._label,
                hintText: widget._hint
            ),
            onSaved: (value){
              widget.callback(value);
            },
          ),
        ],
      ),
    );
  }
}
