import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChartApp(),
    );
  }
}

class ChartApp extends StatefulWidget {
  const ChartApp({Key? key}) : super(key: key);

  @override
  _ChartAppState createState() => _ChartAppState();
}

class _ChartAppState extends State<ChartApp> {
  late List<SeriesData> chartData;
  String pointValue = '';

  @override
  void initState() {
    chartData = <SeriesData>[
      SeriesData('Mon', 10),
      SeriesData('Tue', 20),
      SeriesData('Wed', 30),
      SeriesData('Thus', 40),
      SeriesData('Fri', 50),
      SeriesData('Sat', 60),
      SeriesData('Sun', 70),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: 
        SfCircularChart(
          annotations: [
            CircularChartAnnotation(
                widget: Text(
              pointValue,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))
          ],
          series: <CircularSeries<SeriesData, String>>[
            DoughnutSeries(
                onPointTap: (pointInteractionDetails) {
                  pointValue = pointInteractionDetails
                          .dataPoints![pointInteractionDetails.pointIndex!].y
                          .toString() +
                      '%';
                  setState(() {});
                },
                dataSource: chartData,
                xValueMapper: (SeriesData data, _) => data.x,
                yValueMapper: (SeriesData data, _) => data.y)
          ],
        ));
  }
}

class SeriesData {
  SeriesData(this.x, this.y);
  final String x;
  final num y;
}