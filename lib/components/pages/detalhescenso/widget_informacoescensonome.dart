import 'package:desafioedusoft/core/censos/models/censonome.dart';
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:desafioedusoft/functions/formatavalorcompontos.dart';
import 'package:flutter/material.dart';

///Widget Informações do censo selecionado
Widget WidgetInformacoesCensoNome({
  required CensoNome censoNome,
  required Censos censoSelecionado,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            ///Icon Flutuante # rank e Person
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Icon(
                        Icons.people,
                        size: 75,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Text(
                        '#${censoSelecionado.rank.toString()}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            ///Text Nome
            Center(
              child: Text(
                censoNome.nome,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),
            ),
            Text(
              'Este nome esta na possição #${censoSelecionado.rank.toString()}',
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ],
        ),
      ),
      Text(
        'Localidade: ${censoNome.localidade}',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      Text(
        'Sexo: ${censoNome.sexo == '' ? 'Não Informado *' : censoNome.sexo}',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      // Text(
      //   'Rank: ${censoSelecionado.rank.toString()}',
      //   style: TextStyle(
      //     fontSize: 17,
      //   ),
      // ),
      Text(
        'Frequencia: ${formataNumeroComPontos(numero: censoSelecionado.freq.toString())}',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    ],
  );
}
