import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controles criados para pegar os dados inseridos
  TextEditingController pesoControle = TextEditingController();
  TextEditingController alturaControle = TextEditingController();
  String infoText = "Informe seus dados";
  // para testar os dados do form, usaremos uma chave global
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // criar a função para limpar os campos
  void resetFields() {
    pesoControle.text = '';
    alturaControle.text = "";
    setState(() {
      infoText = "Informe seus dados";
      formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double peso = double.parse(pesoControle.text);
      double altura = double.parse(alturaControle.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 16) {
        infoText = 'Magreza grave (${imc.toStringAsPrecision(4)})';
      } else if (imc < 17) {
        infoText = 'Magreza moderada (${imc.toStringAsPrecision(4)})';
      } else if (imc < 18.5) {
        infoText = 'Magreza leve (${imc.toStringAsPrecision(4)})';
      } else if (imc < 25) {
        infoText = 'Saudável (${imc.toStringAsPrecision(4)})';
      } else if (imc < 30) {
        infoText = 'Sobrepeso (${imc.toStringAsPrecision(4)})';
      } else if (imc < 35) {
        infoText = 'Obsidade Grau 1 (${imc.toStringAsPrecision(4)})';
      } else if (imc < 40) {
        infoText = 'Obsidade Grau 2 Severa (${imc.toStringAsPrecision(4)})';
      } else {
        infoText = 'Obsidade Grau 3 Mórbida (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: resetFields,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                // definir a entrada de dados
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso kg',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                  ),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
                // definindo o controlador
                controller: pesoControle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                // definir a entrada de dados
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura cm',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                  ),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
                controller: alturaControle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua  Altura!";
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              //-------

              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                  color: Colors.green,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('ANIMADO'),
                    RotateAnimatedText('OTIMISTA'),
                    RotateAnimatedText('DIFERENTE'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),

              //------
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                calculate();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text(
              'Cacular',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),

        /* Container(
          height: 50.0,
          color: Colors.green,
          child: const Text(
            'Petrópolis City',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),*/
      ),
    );
  }
}