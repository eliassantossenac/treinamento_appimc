import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/calculator.jpg',
            width: 50,
            height: 50,
          ),
          const Text(
            'Senac - TI',
            style: TextStyle(
              fontSize: 40,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 10.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Treinamento em Flutter',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 15.0),
              Icon(
                Icons.flutter_dash,
                color: Colors.green,
                size: 30,
              )
            ],
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Desenvolvido por Elias',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            '17/05/2024',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
