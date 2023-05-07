import 'package:desafioedusoft/core/censos/models/datafrequencia.dart';
import 'package:desafioedusoft/functions/separadoisperiododata.dart';


String calculaPorcentagem({required String data, required int frequencia}) {
  String restoValorData = ''; 
  restoValorData = separaDoisPeriodoData(data: data);
  int frequenciaDataselecionada = _dataFrequencia
      .map((e) => e)
      .where((element) => element.periodo == restoValorData)
      .first
      .frequencia;

  double valorFinal = (frequencia / frequenciaDataselecionada) * 100;

  String porcentagemValorFinal = '${valorFinal.toStringAsFixed(3)}%';
  // .toStringAsFixed(0));

  return porcentagemValorFinal;
}

List<DataFrequencia> _dataFrequencia = [
  DataFrequencia('1920', 30635605),
  DataFrequencia('1930', 35935960),
  DataFrequencia('1940', 41236315),
  DataFrequencia('1950', 51944397),
  DataFrequencia('1960', 70191370),
  DataFrequencia('1970', 93139037),
  DataFrequencia('1980', 119002706),
  DataFrequencia('1990', 146825475),
  DataFrequencia('2000', 190732694),
  DataFrequencia('2010', 196732694),
  DataFrequencia('2020', 213232694),
];
