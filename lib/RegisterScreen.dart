import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import da tela Home

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  TextEditingController usernameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Variável para o campo de seleção de gênero
  String? selectedGender;

  // Variável para mostrar/ocultar senha
  bool showPassword = false;

  // Função de validação e cadastro
  void _register() {
    if (_formKey.currentState!.validate()) {
      // Se todos os campos obrigatórios forem válidos, o usuário será redirecionado para a HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomeScreen(username: usernameController.text)),
      );
    } else {
      // Se houver campos obrigatórios faltantes ou inválidos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Ainda faltam campos obrigatórios.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Color(0xFF4A7AE0), // Cor do cabeçalho
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 500), // Aumenta o tamanho máximo da caixa
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 32.0), // Espaçamento horizontal nas bordas
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Campo de Nome (Opcional)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  SizedBox(height: 16),

                  // Campo de Username (Obrigatório)
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    style: TextStyle(color: Color(0xFFA37FEB)), // Cor do texto
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Esse campo é obrigatório.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Campo de Data de Nascimento (Obrigatório)
                  TextFormField(
                    controller: birthdateController,
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                    ),
                    style: TextStyle(color: Color(0xFFA37FEB)), // Cor do texto
                    keyboardType: TextInputType.datetime,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Esse campo é obrigatório.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Campo de Email (Obrigatório)
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    style: TextStyle(color: Color(0xFFA37FEB)), // Cor do texto
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Esse campo é obrigatório.';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Digite um email válido.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Campo de Telefone (Opcional)
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                    ),
                    style: TextStyle(color: Color(0xFFA37FEB)), // Cor do texto
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                  ),
                  SizedBox(height: 16),

                  // Campo de Seleção de Sexo
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sexo (Opcional)'),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('M'),
                              value: 'Masculino',
                              groupValue: selectedGender,
                              activeColor: Color(0xFFA37FEB), // Cor da bolinha
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('F'),
                              value: 'Feminino',
                              groupValue: selectedGender,
                              activeColor: Color(0xFFA37FEB), // Cor da bolinha
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Outro'),
                              value: 'Outro',
                              groupValue: selectedGender,
                              activeColor: Color(0xFFA37FEB), // Cor da bolinha
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Campo de Senha (Obrigatório)
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: Color(0xFFA37FEB)), // Cor do texto
                    obscureText: !showPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Esse campo é obrigatório.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Campo de Confirmação de Senha (Obrigatório)
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirme a Senha',
                    ),
                    style: TextStyle(color: Color(0xFFA37FEB)), // Cor do texto
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Esse campo é obrigatório.';
                      }
                      if (value != passwordController.text) {
                        return 'As senhas não coincidem.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32),

                  // Botão de Cadastro
                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Cor de fundo do botão
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                          color: Color(0xFFA37FEB)), // Cor do texto do botão
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
