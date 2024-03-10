import 'package:flutter/material.dart';

class HappySlider extends StatefulWidget {
  final Function callback;
  const HappySlider(this.callback, {super.key});

  @override
  State<HappySlider> createState() => _HappySliderState();
}

class _HappySliderState extends State<HappySlider> {
  // value of the slider
  double _happiness = 1;

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
            value: _happiness,
            min: 1,
            max: 10,
            divisions: 9,
            label: _happiness.round().toString(),
            onChanged: (value){
              setState(() {
                _happiness = value;
              });
                widget.callback(_happiness);
            },
          )
        )
      ]
    );
  }
}
