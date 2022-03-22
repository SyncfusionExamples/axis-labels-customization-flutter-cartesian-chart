import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            child: SfCartesianChart(
                borderWidth: 10,
                primaryXAxis: CategoryAxis(
                  axisLabelFormatter: (AxisLabelRenderDetails args) {
                    late String text;
                    late TextStyle textStyle;
                    text = '${args.text}st\nMonth';
                    if (args.text == 'Jan')
                      textStyle =
                          args.textStyle.copyWith(fontFamily: 'DancingScript');
                    if (args.text == 'Feb')
                      textStyle = args.textStyle.copyWith(color: Colors.green);
                    if (args.text == 'Mar')
                      textStyle = args.textStyle.copyWith(fontSize: 15);
                    if (args.text == 'Apr')
                      textStyle =
                          args.textStyle.copyWith(fontStyle: FontStyle.italic);
                    if (args.text == 'May')
                      textStyle =
                          args.textStyle.copyWith(fontWeight: FontWeight.bold);
                    return ChartAxisLabel(text, textStyle);
                  },
                ),
                primaryYAxis: NumericAxis(minimum: 20),
                backgroundColor: Colors.white,
                series: <ChartSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
