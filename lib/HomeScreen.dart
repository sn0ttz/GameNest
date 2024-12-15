import 'package:flutter/material.dart';
import 'package:gamenest/Login.dart'; // Importa a tela de login
import 'package:gamenest/UserScreen.dart'; // Importa a tela de perfil do usuário
import 'package:gamenest/GameDetailPage.dart'; // Importa a tela de detalhes do jogo

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Índice atual da BottomNavigationBar

  // Exemplo de lista de jogos e jogadores
  List<Map<String, dynamic>> games = [
    {
      "name": "Counter-Strike",
      "players": ["Jogador 1", "Jogador 2", "Jogador 3"],
    },
    {
      "name": "League of Legends",
      "players": ["Jogador 4", "Jogador 5", "Jogador 6"],
    },
    {
      "name": "Valorant",
      "players": ["Jogador 7", "Jogador 8", "Jogador 9"],
    },
  ];

  // Método para mudar de tela com a BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(username: widget.username)),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => UserScreen(username: widget.username)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos Disponíveis',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ícone de seta para voltar
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false, // Remove todas as rotas anteriores
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: List.generate(games.length, (index) {
            return Card(
              color: const Color.fromARGB(255, 27, 83, 125),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      games[index]["name"],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      'Vagas: 1/5',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameDetailPage(
                              gameName: games[index]["name"],
                              players:
                                  List<String>.from(games[index]["players"]),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text('Entrar na sala',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Define o índice atual
        onTap: _onItemTapped, // Chama o método para mudar de tela
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Resultados para: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Sugestões para: $query'),
    );
  }
}
