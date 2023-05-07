import 'package:http/http.dart' as http;
import 'dart:convert';

class RequisicaoService {
  Future<http.Response> get({required String rota}) async {
    Uri _uri = Uri.parse(rota);
    return await http.get(
      _uri,
    );
  }
}
