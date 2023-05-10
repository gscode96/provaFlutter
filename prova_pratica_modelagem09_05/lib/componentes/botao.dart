import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prova_pratica_modelagem/componentes/texto.dart';

class Botao extends StatefulWidget {
  const Botao({
    super.key,
    this.funcaoBotao,
    this.tamanhoTexto,
    this.textoBotao,
  });

  final textoBotao;
  final funcaoBotao;
  final tamanhoTexto;

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: widget.funcaoBotao,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(100, 60),
        ),
        child: Texto(
          conteudo: widget.textoBotao,
          tamanhoTexto: widget.tamanhoTexto,
        ),
      ),
    );
  }
}
