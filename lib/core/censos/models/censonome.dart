import 'package:desafioedusoft/core/censos/models/datafrequencia.dart';

class CensoNome {
  String nome;
  String sexo;
  String localidade;
  List<DataFrequencia> res;

  CensoNome(
    this.nome,
    this.sexo,
    this.localidade,
    this.res,
  );

  @override
  String toString() {
    // TODO: implement toString
    return '{nome: $nome, sexo: $sexo, localidade: $localidade, res: $res}';
  }
}
