import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TempChar extends StatelessWidget {
  const TempChar({super.key, required this.value});

  final num value;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      animationDuration: 2500,
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          interval: 10,
          labelOffset: 0.1,
          tickOffset: 0.125,
          minorTicksPerInterval: 0,
          labelsPosition: ElementsPosition.outside,
          offsetUnit: GaugeSizeUnit.factor,
          showAxisLine: false,
          showLastLabel: true,
          radiusFactor: 0.8,
          maximum: 120,
          pointers: <GaugePointer>[
            WidgetPointer(
              offset: -5,
              value: value.toDouble(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                    )),
                height: 45,
                width: 45,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                      Container(
                        width: 10,
                        height: 18,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(
                              'assets/temperature_indicator_light.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                            color: Color.fromRGBO(126, 126, 126, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 40,
              color: const Color.fromRGBO(74, 177, 70, 1),
            ),
            GaugeRange(
              startValue: 40,
              endValue: 80,
              color: const Color.fromRGBO(251, 190, 32, 1),
            ),
            GaugeRange(
              startValue: 80,
              endValue: 120,
              color: const Color.fromRGBO(237, 34, 35, 1),
            )
          ],
        )
      ],
    );
  }
}
