import 'package:flutter/material.dart';
import 'package:meu_app/pages/main_page.dart';
import 'package:meu_app/shared/app_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController(text: "email@email.com");

  final TextEditingController senhaController =
      TextEditingController(text: "123");

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 21, 52, 71),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset(AppImages.logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Já tem cadastro?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 10),

              const Text(
                "Faça seu login e make the change_",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 86, 213, 124)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 86, 213, 124)),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 86, 213, 124)),
                  prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 86, 213, 124)),
                ),
              ),

              const SizedBox(height: 25),
              TextField(
                controller: senhaController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 86, 213, 124)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color:Color.fromARGB(255, 86, 213, 124)),
                  ),
                  hintText: "Senha",
                  hintStyle: const TextStyle(color:Color.fromARGB(255, 86, 213, 124)),
                  prefixIcon: const Icon(Icons.lock, color:Color.fromARGB(255, 86, 213, 124)),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() => isObscure = !isObscure);
                    },
                    child: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    if (emailController.text.trim() == "email@email.com" &&
                        senhaController.text.trim() == "123") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Erro ao efetuar o Login"),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 86, 213, 124),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                    color:Color.fromARGB(1, 86, 213, 124),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Criar Conta",
                  style: TextStyle(
                    color:Color.fromARGB(1, 86, 213, 124),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
