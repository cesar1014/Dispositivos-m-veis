import 'package:flutter/material.dart';

class Atividade1 extends StatefulWidget {
  const Atividade1({Key? key}) : super(key: key);

  @override
  State<Atividade1> createState() => _Atividade1State();
}

class _Atividade1State extends State<Atividade1> {
  String _nome = '';
  List<double> _notas = List.filled(4, 0.0);
  String _resultado = '';

  void _calculaMedia() {
    double somaNotas = _notas.reduce((value, element) => value + element);
    double media = somaNotas / _notas.length;

    setState(() {
      _resultado = '$_nome obteve média $media';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Média'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (String valor) {
                _nome = valor;
              },
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
            SizedBox(),
            for (int i = 0; i < 4; i++)
              Row(
                children: [
                  Text('Nota ${i + 1}:'),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: (String valor) {
                        _notas[i] = double.tryParse(valor) ?? 0;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            SizedBox(),
            ElevatedButton(
              onPressed: () {
                _calculaMedia();
              },
              child: const Text('Calcular Média'),
            ),
            SizedBox(),
            Text(
              _resultado,
            ),
          ],
        ),
      ),
    );
  }
}
