import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({Key? key}) : super(key: key);

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  String _nome = '';
  String _notaDigitada = '';
  String _resultado = 'Fulano foi aprovado';

  void _calculaResultado() {
    var nota = double.tryParse(_notaDigitada);

    setState(() {
      if (nota != null) {
        if (nota >= 6.0) {
          _resultado = '$_nome foi aprovado!';
        } else {
          _resultado = '$_nome foi reprovado';
        }
      } else {
        _resultado = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado final:'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('Nome:'),
              SizedBox(
                width: 100,
                child: TextField(
                  onChanged: (String valor) {
                    _nome = valor;
                    print(_nome);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Nota:'),
              SizedBox(
                width: 100,
                child: TextField(
                  onChanged: (String valor) {
                    _notaDigitada = valor;
                    print(_notaDigitada);
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _calculaResultado();
            },
            child: Text('Resultado'),
          ),
          Row(
            children: [
              Text('$_resultado'),
            ],
          )
        ],
      ),
    );
  }
}
