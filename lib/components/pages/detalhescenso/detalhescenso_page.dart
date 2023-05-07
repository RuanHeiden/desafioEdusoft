import 'package:desafioedusoft/components/pages/detalhescenso/widget_graficocenso.dart';
import 'package:desafioedusoft/components/pages/detalhescenso/widget_graficocensonome.dart';
import 'package:desafioedusoft/components/pages/detalhescenso/widget_informacoescensonome.dart';
import 'package:desafioedusoft/core/censos/censonome_service.dart';
import 'package:desafioedusoft/core/censos/models/censonome.dart';
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:desafioedusoft/core/censos/models/datafrequencia.dart';
import 'package:desafioedusoft/functions/calculaPorcentagem.dart';
import 'package:desafioedusoft/functions/formatavalorcompontos.dart';
import 'package:desafioedusoft/functions/remove_colchetes.dart';
import 'package:desafioedusoft/functions/separadoisperiododata.dart';
import 'package:desafioedusoft/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetalhesCensoPage extends StatefulWidget {
  Censos censoSelecionado;
  DetalhesCensoPage({super.key, required this.censoSelecionado});

  @override
  State<DetalhesCensoPage> createState() =>
      _DetalhesCensoPageState(censoSelecionado: censoSelecionado);
}

class _DetalhesCensoPageState extends State<DetalhesCensoPage> {
  Censos censoSelecionado;
  _DetalhesCensoPageState({required this.censoSelecionado});

  ///CENSO TESTE
  final censoNomeService = getIt<CensoNomeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes Censos Nome'),
      ),
      body: Container(
        child: FutureBuilder(
          future: censoNomeService.buscaCensoNome(nome: censoSelecionado.nome),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('none');
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.active:
                return Text('active');
              case ConnectionState.done:
                CensoNome _censoNome = snapshot.data!;
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetInformacoesCensoNome(
                              censoNome: _censoNome,
                              censoSelecionado: censoSelecionado,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                color: Colors.grey.shade400,
                                width: double.infinity,
                                height: 0.5,
                              ),
                            ),
                            WidgetTabelaCenso(
                              censoNome: _censoNome,
                              censoSelecionado: censoSelecionado,
                            ),
                            WidgetGraficoCensoNome(dataFrequencia: _censoNome.res),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
 

extension extensionWidget on Widget {
  Widget paddingTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: this,
    );
  }
}
