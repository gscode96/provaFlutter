import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_modelagem/componentes/botao.dart';

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({super.key});

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {
  double blockchain = 0.0;
  double coinbase = 0.0;
  double bitstamp = 0.0;
  double foxbit = 0.0;
  double bitcoin = 0.0;

  searchBitCoin() async {
    const String urlViaHbg =
        'https://api.hgbrasil.com/finance?format=json-cors&key=a23a338f';
    Response respost = await get(Uri.parse(urlViaHbg));
    Map address = jsonDecode(respost.body);
    blockchain = address['results']['available_sources']['bitcoin']
        ['blockchain_info']['format']['buy'];
    coinbase = address['results']['available_sources']['bitcoin']['coinbase']
        ['format']['buy'];
    bitstamp = address['results']['available_sources']['bitcoin']['bitstamp']
        ['format']['buy'];
    foxbit = address['results']['available_sources']['bitcoin']['foxbit']
        ['format']['buy'];
    bitcoin = address['results']['available_sources']['bitcoin']
        ['mercadobitcoin']['format']['buy'];

    setState(() {});
  }

  Proximo() {
    Navigator.pushNamed(context, '/TelaMoeda');
  }

  @override
  Widget build(BuildContext context) {
    searchBitCoin();
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
                    'BitCoin',
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
                                  'Blockchain',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: Text(
                                  'CoinBase',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$blockchain',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$coinbase',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                  'BitStamp',
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: const Text(
                                  'Foxbit',
                                  style: TextStyle(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$bitstamp',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                                Expanded(
                                    child: Text(
                                  '$foxbit',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                  'Bitcoin',
                                  style: TextStyle(),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '$bitcoin',
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
                      textoBotao: 'Página Principal'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
