
import 'package:flutter/material.dart';

class V2 extends StatefulWidget {
  const V2({super.key});

  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
  double _topLeft = 50;
  double _topRight = 0;
  double _bottomLeft = 50;
  double _bottomRight = 0;

  Widget _buildSlider(
      String title,
      double value,
      ValueChanged<double> onChanged,
      ) {
    return Column(
      children: [
        Text('$title: ${value.toStringAsFixed(2)}'),
        Slider(
          value: value,
          min: 0,
          max: 75,
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),

          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_topLeft),
                  topRight: Radius.circular(_topRight),
                  bottomLeft: Radius.circular(_bottomLeft),
                  bottomRight: Radius.circular(_bottomRight),
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildSlider('TL', _topLeft, (value) {
                      setState(() {
                        _topLeft = value;
                      });
                    }),
                    _buildSlider('BL', _bottomLeft, (value) {
                      setState(() {
                        _bottomLeft = value;
                      });
                    }),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildSlider('TR', _topRight, (value) {
                      setState(() {
                        _topRight = value;
                      });
                    }),
                    _buildSlider('BR', _bottomRight, (value) {
                      setState(() {
                        _bottomRight = value;
                      });
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
