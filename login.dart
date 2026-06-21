import 'package:flutter/material.dart';
import 'CalendarPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool naTelaLogin = true;
  bool telaBoasVindas = false;
  
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();

  void entrar() {
    if (txtEmail.text.isNotEmpty && txtSenha.text.isNotEmpty) {
      setState(() {
        telaBoasVindas = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos para prosseguir')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (telaBoasVindas) {
      return Scaffold(
        backgroundColor: const Color(0xFF1E222B),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              color: const Color(0xFF393E46), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ACESSO LIBERADO',
                    style: TextStyle(fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold, color: Color(0xFF00ADB5)),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Bem Vindo(a) Aluno(a)!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'RA: 1234567',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00ADB5),
                      minimumSize: const Size(double.infinity, 45),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const CalendarPage()),
                      );
                    },
                    child: const Text('ENTRAR', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.dns_outlined, size: 48, color: Color(0xFF00ADB5)),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                color: const Color(0xFF393E46),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          naTelaLogin ? 'LOGIN' : 'CADASTRO',
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              naTelaLogin = !naTelaLogin;
                            });
                          },
                          child: Text(
                            naTelaLogin ? 'Criar conta' : 'Login',
                            style: const TextStyle(color: Color(0xFF00ADB5), decoration: TextDecoration.underline, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Email (aluno@gmail.com)',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: txtEmail,
                      style: const TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Senha (123)',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: txtSenha,
                      obscureText: true,
                      style: const TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 28),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00ADB5),
                        minimumSize: const Size(double.infinity, 48),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      onPressed: entrar,
                      child: Text(
                        naTelaLogin ? 'CONECTAR' : 'REGISTRAR',
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}