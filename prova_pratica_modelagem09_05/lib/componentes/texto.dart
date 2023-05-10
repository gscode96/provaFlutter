import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Texto extends StatefulWidget {
  Texto({
    super.key,
    this.conteudo,
    this.tamanhoTexto,
  });

  String? conteudo;
  double? tamanhoTexto;

  @override
  State<Texto> createState() => _TextoState();
}

class _TextoState extends State<Texto> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.conteudo!,
      style: TextStyle(
          fontSize: widget.tamanhoTexto,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    );
  }
}
