 
import 'package:desafioedusoft/components/pages/detalhescenso/detalhescenso_page.dart';
import 'package:desafioedusoft/core/censos/models/censos.dart';
import 'package:desafioedusoft/functions/formatavalorcompontos.dart';
import 'package:flutter/material.dart';

class CardCenso extends StatelessWidget {
  Censos censos;
  CardCenso({super.key, required this.censos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      child: Material(
        elevation: 1,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesCensoPage(censoSelecionado: censos)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      /// Icon person
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.people,
                          size: 32,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.blue,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    censos.nome,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'Rank: #${censos.rank.toString()}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Freq: ${formataNumeroComPontos(numero: censos.freq.toString())}',
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
