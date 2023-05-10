import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_modelagem/componentes/botao.dart';

class TelaAcao extends StatefulWidget {
  const TelaAcao({super.key});

  @override
  State<TelaAcao> createState() => _TelaAcaoState();
}

class _TelaAcaoState extends State<TelaAcao> {
  double ibovespa = 0.0;
  double ifix = 0.0;
  double nasdaq = 0.0;
  double downjones = 0.0;
  double cac = 0.0;
  double nikkei = 0.0;

  searchStocks() async {
    const String urlViaHbg =
        'https://api.hgbrasil.com/finance?format=json-cors&key=a23a338f';
    Response respost = await get(Uri.parse(urlViaHbg));
    Map address = jsonDecode(respost.body);
    ibovespa = address['results']['stocks']['IBOVESPA']['points'];
    ifix = address['results']['stocks']['IFIX']['points'];
    nasdaq = address['results']['stocks']['NASDAQ']['points'];
    downjones = address['results']['stocks']['DOWJONES']['points'];
    cac = address['results']['stocks']['CAC']['points'];
    nikkei = address['results']['stocks']['NIKKEI']['points'];

    setState(() {});
  }

  Proximo() {
    Navigator.pushNamed(context, '/TelaBitcoin');
  }

  @override
  Widget build(BuildContext context) {
    searchStocks();
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
                    'Açoes',
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
                              children: [
                                Expanded(
                                    child: Text(
                                  'Ibovespa',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: Text(
                                  'IFIX',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$ibovespa',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$ifix',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                  'Nasdaq',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: const Text(
                                  'DonwJones',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$nasdaq',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$downjones',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                  'CAC',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: const Text(
                                  'Nikkei',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$cac',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$nikkei',
                                  style: TextStyle(
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
                      textoBotao: 'Ir para bitcoin'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
