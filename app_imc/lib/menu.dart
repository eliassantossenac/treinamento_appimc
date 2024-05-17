import 'package:app_imc/calculadora.dart';
import 'package:app_imc/sobre.dart';
import 'package:flutter/material.dart';

class Opcoes extends StatelessWidget {
  const Opcoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  //color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('images/calculator.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  'Menu Principal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
              ListTile(
                trailing: const Icon(Icons.home, color: Colors.green),
                title: const Text(
                  'Menu',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Opcoes()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.calculate, color: Colors.green),
                title: const Text(
                  'Calculadora',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Sobre o App',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sobre()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Image.asset(
            'images/calculator.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ));
  }
}
