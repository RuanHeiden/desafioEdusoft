import 'package:desafioedusoft/components/pages/detalhescenso/detalhescenso_page.dart';
import 'package:desafioedusoft/core/censos/models/censonome.dart';
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:desafioedusoft/core/censos/models/datafrequencia.dart';
import 'package:desafioedusoft/functions/calculaPorcentagem.dart';
import 'package:desafioedusoft/functions/formatavalorcompontos.dart';
import 'package:desafioedusoft/functions/remove_colchetes.dart';
import 'package:flutter/material.dart';

/// Widget de tabel do censo nome
Widget WidgetTabelaCenso(
    {required Censos censoSelecionado, required CensoNome censoNome}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Tabela de Frequência e Porcentagem com o uso do nome ${censoSelecionado.nome} nos respectivos anos',
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ),
      Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.symmetric(
                inside: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              children: _listaTableCellCenso(
                dataFrequencia: censoNome.res,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

List<TableRow> _listaTableCellCenso({
  required List<DataFrequencia> dataFrequencia,
}) {
  List<TableRow> listaTableRow = dataFrequencia
      .map((dataFrequencia) => TableRow(
            children: [
              TableCell(
                child: Text(
                  removeColchetes(valor: dataFrequencia.periodo.toString()),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ).paddingTable(),
              ),
              TableCell(
                child: Text(
                  formataNumeroComPontos(
                      numero: dataFrequencia.frequencia.toString()),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ).paddingTable(),
              ),
              TableCell(
                child: Text(
                  calculaPorcentagem(
                    data: removeColchetes(valor: dataFrequencia.periodo),
                    frequencia: dataFrequencia.frequencia,
                  ),
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ).paddingTable(),
              ),
            ],
          ))
      .toList();
  listaTableRow.insert(
    0,
    const TableRow(
      children: [
        TableCell(
          child: Text(
            ' Periodo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        TableCell(
          child: Text(
            ' Frequencia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        TableCell(
          child: Text(
            ' População',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
  return listaTableRow;
}
