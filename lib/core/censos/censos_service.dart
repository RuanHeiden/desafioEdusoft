import 'dart:convert';
 
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:desafioedusoft/core/http/requisicao_service.dart';
import 'package:http/http.dart';

class CensosService {
  final RequisicaoService requisicaoService;
  CensosService({required this.requisicaoService});

  /// URL CENSO
  final String url = 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/';

  Future<List<Censos>> buscaCensos() async {
    try {
      Response response = await requisicaoService.get(rota: url);
      List<dynamic> _censosListResponse = json.decode(response.body);
      List<Censos> _censoList = [];
      for (int i = 0; i < _censosListResponse.length; i++) {
        Censos _censos = Censos(
          _censosListResponse[i]['nome'],
          _censosListResponse[i]['regiao'],
          _censosListResponse[i]['freq'],
          _censosListResponse[i]['rank'],
          _censosListResponse[i]['sexo'],
        );
       _censoList.add(_censos);
      }  
      return _censoList;
    } catch (e) {
      print('Algo deu errado em buscar os censos : $e');
      return [];
    }
  }
}
