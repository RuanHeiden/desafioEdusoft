 
import 'package:desafioedusoft/components/widgets/card_censos.dart';
import 'package:desafioedusoft/core/censos/censonome_service.dart'; 
import 'package:desafioedusoft/core/censos/censos_service.dart';
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:desafioedusoft/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final censosService = getIt<CensosService>();
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Censos Nomes'),
      ),
      body: Column(
        children: [
          Expanded( 
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: FutureBuilder(
                future: censosService.buscaCensos(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('none');
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                      return const Text('active');
                    case ConnectionState.done:
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Censos censos = snapshot.data![index];
                          return CardCenso(
                            censos: censos,
                          );
                        },
                      );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
