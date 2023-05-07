import 'package:desafioedusoft/core/censos/censonome_service.dart';
import 'package:desafioedusoft/core/censos/models/censonome.dart';
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
 
import 'core/censos/censos_service.dart';
import 'core/http/requisicao_service.dart';
import 'components/pages/home_page.dart';

GetIt getIt = GetIt.instance;
void main() {
  runApp(const MyApp());

  getIt.registerSingleton<RequisicaoService>(
    RequisicaoService(),
  );
  getIt.registerSingleton<CensosService>(
    CensosService(requisicaoService: getIt<RequisicaoService>()),
  );

  getIt.registerSingleton<CensoNomeService>(
    CensoNomeService(
      requisicaoService: getIt<RequisicaoService>(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edusoft - Censos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
