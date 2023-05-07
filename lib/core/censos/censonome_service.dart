import 'dart:convert';

import 'package:desafioedusoft/core/censos/models/censonome.dart';
import 'package:desafioedusoft/core/censos/models/datafrequencia.dart';
import 'package:desafioedusoft/core/http/requisicao_service.dart';
import 'package:http/http.dart';

class CensoNomeService {
  final RequisicaoService requisicaoService;
  CensoNomeService({required this.requisicaoService});

  /// URL CENSO
  final String url = 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/';

  Future<CensoNome> buscaCensoNome({required String nome}) async {
    /// String nome = 'Maria';
    String _url = url + nome;

    Response response = await requisicaoService.get(rota: _url);
    List<dynamic> _censosListResponse = json.decode(response.body);
    List<DataFrequencia> _listDataFrequencia = [];
    for (int i = 0; i < _censosListResponse.first['res'].length; i++) {
      var resAtual = _censosListResponse.first['res'][i];
      DataFrequencia dataFrequencia = DataFrequencia(
        resAtual['periodo'],
        resAtual['frequencia'],
      );
      _listDataFrequencia.add(dataFrequencia);
    }
    CensoNome censoNome = CensoNome(
      _censosListResponse.first['nome'] ?? '',
      _censosListResponse.first['sexo'] ?? '',
      _censosListResponse.first['localidade'] ?? '',
      _listDataFrequencia ?? [],
    );
    return censoNome;
  }
}
