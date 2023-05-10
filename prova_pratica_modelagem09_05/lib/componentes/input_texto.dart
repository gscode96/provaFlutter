import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Input_Texto extends StatefulWidget {
  const Input_Texto({
    super.key,
    this.controller,
    this.msgerro,
    this.senha,
    this.texto,
  });

  final controller;
  final msgerro;
  final texto;
  final senha;

  @override
  State<Input_Texto> createState() => _Input_TextoState();
}

class _Input_TextoState extends State<Input_Texto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.msgerro;
          }
        },
        obscureText: widget.senha,
        decoration: InputDecoration(
          labelText: widget.texto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
