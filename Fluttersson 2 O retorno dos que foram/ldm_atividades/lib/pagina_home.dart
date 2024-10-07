import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos Disponíveis', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.menu_outlined, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Define 2 colunas
          childAspectRatio: 1, // Proporção das caixinhas
          children: List.generate(10, (index) {
            return Card(
              color: const Color.fromARGB(255, 151, 128, 128),
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Menos padding para caixinhas menores
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jogo ${index}', // Nome do jogo
                      style: const TextStyle(color: Colors.white, fontSize: 16), // Tamanho de fonte menor
                    ),
                    Text(
                      'Vagas: 1/5', // Vagas disponíveis
                      style: const TextStyle(color: Colors.white70, fontSize: 14), // Tamanho de fonte menor
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Ação do botão "Entrar" (sem funcionalidade)
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple, // Roxo escuro
                      ),
                      child: const Text('Entrar', style: TextStyle(color: Colors.white)), // Texto do botão
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

