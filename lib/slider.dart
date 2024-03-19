import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HappySlider extends StatefulWidget {
  final Function callback;
  // value of the slider
  double _happiness;
  HappySlider(this._happiness, this.callback, {super.key});

  static void reset(HappySlider hs){
    hs._happiness = 1;
  }

  @override
  State<HappySlider> createState() => _HappySliderState();
}

class _HappySliderState extends State<HappySlider> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        // Happiness Level slider
        const Text("Happiness Level", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("On a scale of 1-happy, gano kasaya ang adulting?", style: TextStyle(fontSize: 15)),
        Container(
          width: 340,
          child: Slider(
            value: widget._happiness,
            min: 1,
            max: 10,
            divisions: 9,
            label: widget._happiness.round().toString(),
            onChanged: (value){
              setState(() {
                widget._happiness = value;
              });
                widget.callback(widget._happiness);
            },
          )
        )
      ]
    );
  }
}