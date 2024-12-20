import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LinearView extends StatelessWidget {
  const LinearView({super.key, required this.value, required this.title});

  final num value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfLinearGauge(
          animateAxis: true,
          axisTrackStyle: const LinearAxisTrackStyle(thickness: 24),
          markerPointers: <LinearMarkerPointer>[
            LinearWidgetPointer(
              value: value.toDouble(),
              onChanged: (dynamic value) {},
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                    color: Color(0xff06589C),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '$title : ${value.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
