

import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferência';


class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }

}

class ListaTransferenciasState extends State<ListaTransferencias>{

  @override
  Widget build(BuildContext context) {
    debugPrint('valor atual da contagem ${widget._transferencias.length}');
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          return ItemTransferencia(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })
          ).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    //adicionando um delay na request
    // Future.delayed(Duration(seconds: 2), () {
    //   if(transferenciaRecebida != null){
    //     setState((){
    //       widget._transferencias.add(transferenciaRecebida);
    //     });
    //   }
    // });

    if(transferenciaRecebida != null){
      setState((){ //sempre utilizar o setState para atualizacao correta do objeto em tela
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ));
  }
}