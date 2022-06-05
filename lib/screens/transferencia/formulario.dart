
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/Editor.dart';
import '../../models/transferencia.dart';

const _tituloAppbar = 'Criando Transferencia';
const _rotuloValor = 'Valor';
const _rotuloNumeroConta = 'Numero da Conta';
const _dicaValor = '0000';
const _confirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{

  final TextEditingController _controllerFieldAccountNumber = TextEditingController();
  final TextEditingController _controllerFieldAccountValue = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    debugPrint(_controllerFieldAccountNumber.text);
    debugPrint(_controllerFieldAccountValue.text);

    final int? numeroConta =
    int.tryParse(_controllerFieldAccountNumber.text);
    final double? valor =
    double.tryParse(_controllerFieldAccountValue.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('metodo _criaTransferencia chamado');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$transferenciaCriada')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppbar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controller: _controllerFieldAccountNumber, rotulo: _rotuloNumeroConta, dica: _dicaValor,),
              Editor(controller: _controllerFieldAccountValue, rotulo: _rotuloValor, dica: _dicaValor, icone: Icons.monetization_on),
              ElevatedButton(
                onPressed: () {
                  _criaTransferencia(context);
                },
                child: Text(_confirmar),
              ),
            ],
          ),
        ));
  }

}
