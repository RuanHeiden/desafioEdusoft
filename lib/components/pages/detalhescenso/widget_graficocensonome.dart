import 'package:desafioedusoft/core/censos/models/datafrequencia.dart';
import 'package:desafioedusoft/functions/remove_colchetes.dart';
import 'package:desafioedusoft/functions/separadoisperiododata.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget WidgetGraficoCensoNome({required List<DataFrequencia> dataFrequencia}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 8, left: 8, right: 8),
        child: Text(
          'Gráfico Censo nome com base nos períodos do anos',
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ),
      Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SfCartesianChart(
            series: <ChartSeries>[
              LineSeries<DataFrequencia, double>(
                dataSource: dataFrequencia,
                xValueMapper: (DataFrequencia datafreq, _) => double.parse(
                    separaDoisPeriodoData(
                        data: removeColchetes(valor: datafreq.periodo))),
                yValueMapper: (DataFrequencia datafreq, _) =>
                    datafreq.frequencia,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
