import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_modelagem/componentes/botao.dart';

class TelaMoeda extends StatefulWidget {
  const TelaMoeda({super.key});

  @override
  State<TelaMoeda> createState() => _TelaMoedaState();
}

class _TelaMoedaState extends State<TelaMoeda> {
  double dollar = 0.0;
  double euro = 0.0;
  double peso = 0.0;
  double yen = 0.0;
  double varDollar = 0.0;
  double varEuro = 0.0;
  double varPeso = 0.0;
  double varYen = 0.0;

  searchCurrenc() async {
    const String urlViaHbg =
        'https://api.hgbrasil.com/finance?format=json-cors&key=a23a338f';
    Response respost = await get(Uri.parse(urlViaHbg));
    Map address = jsonDecode(respost.body);
    dollar = address['results']['currencies']['USD']['buy'];
    varDollar = address['results']['currencies']['USD']['variation'];
    euro = address['results']['currencies']['EUR']['buy'];
    varEuro = address['results']['currencies']['EUR']['variation'];
    peso = address['results']['currencies']['ARS']['buy'];
    varPeso = address['results']['currencies']['ARS']['variation'];
    yen = address['results']['currencies']['JPY']['buy'];
    varYen = address['results']['currencies']['JPY']['variation'];

    setState(() {});
  }

  Proximo() {
    Navigator.pushNamed(context, '/TelaAcao');
  }

  @override
  Widget build(BuildContext context) {
    searchCurrenc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: const Text(
          'Finanças de hoje',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Moedas',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 800,
                      height: 200,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black, style: BorderStyle.solid),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Expanded(
                                    child: Text(
                                  'Dollar',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: Text(
                                  'Euro',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$dollar',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$euro',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    child: Text(
                                  'Peso',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: Text(
                                  'Yen',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$peso',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$yen',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Botao(
                      funcaoBotao: Proximo,
                      tamanhoTexto: 10,
                      textoBotao: 'Ir para ações'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
