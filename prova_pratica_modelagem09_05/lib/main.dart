import 'package:flutter/material.dart';
import 'package:prova_pratica_modelagem/telas/tela_acao.dart';
import 'package:prova_pratica_modelagem/telas/tela_bitcoin.dart';
import 'package:prova_pratica_modelagem/telas/tela_moeda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/TelaMoeda',
      routes: {
        '/TelaMoeda': (context) => const TelaMoeda(),
        '/TelaAcao': (context) => const TelaAcao(),
        '/TelaBitcoin': (context) => const TelaBitcoin(),
      },
    );
  }
}
