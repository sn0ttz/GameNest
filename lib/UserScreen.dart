import 'package:flutter/material.dart';
import 'package:gamenest/HomeScreen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // Exemplo de lista de salas
  List<Map<String, String>> rooms = [
    {
      "name": "Sala 1",
      "description": "Jogo: Counter-Strike",
    },
    {
      "name": "Sala 2",
      "description": "Jogo: League of Legends",
    },
    {
      "name": "Sala 3",
      "description": "Jogo: Valorant",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Foto do usuário e nome
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/user_photo.png'), // Foto do usuário
                ),
                SizedBox(height: 10),
                Text(
                  'Nome do Usuário',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '@username',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Lista de salas
            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(rooms[index]["name"]!),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(rooms[index]["description"]!),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 1, // Página atual (Perfil)
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()), // Navegar para a tela Home
            );
          }
        },
      ),
    );
  }
}
