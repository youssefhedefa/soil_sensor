import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomChar extends StatelessWidget {
  const CustomChar({super.key, required this.value, required this.title});

  final num value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      animationDuration: 3000,
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          startAngle: 180,
          endAngle: 360,
          radiusFactor: 0.9,
          canScaleToFit: true,
          interval: 10,
          showLabels: false,
          showAxisLine: false,
          pointers: <GaugePointer>[
            MarkerPointer(
              value: value.toDouble(),
              elevation: 0,
              markerWidth: 25,
              markerHeight: 25,
              color: const Color(0xFFF67280),
              markerType: MarkerType.circle,
              markerOffset: 25,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 270,
              positionFactor: 0.1,
              widget: Text(
                '$title : $value%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 100,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: const SweepGradient(
                  colors: <Color>[Color(0xFFAB64F5), Color(0xFF62DBF6)],
                  stops: <double>[0.25, 0.75]),
              startWidth: 0.4,
              endWidth: 0.4,
              color: const Color(0xFF00A8B5),
            )
          ],
          showTicks: false,
        ),
      ],
    );
  }
}
