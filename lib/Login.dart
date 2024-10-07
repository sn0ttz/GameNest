import 'package:flutter/material.dart';
import 'package:gamenest/HomeScreen.dart'; // Certifique-se de que este caminho está correto
import 'package:gamenest/UserScreen.dart'; // Importa a tela de usuário

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserScreen()), // Navegar para a tela de perfil
      );
    }
    // Adicione lógica para outras páginas conforme necessário
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Aqui você pode implementar a lógica de autenticação
    print('Username: $username');
    print('Password: $password');

    // Navegar para a tela HomeScreen após o login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login - GameNest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Lógica para redirecionar para a tela de cadastro
              },
              child: Text('Não tem uma conta? Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'GameNest',
    home: LoginPage(),
  ));
}
