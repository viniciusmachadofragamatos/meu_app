import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Garante que o sistema use o modo normal de UI (sem esconder status bar)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light, // cor dos ícones da barra de status
          elevation: 4, // pequena sombra pra destacar
          centerTitle: true, // título centralizado
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;
  int _gerarNumeroAleatorio() {
    math.Random numeroAleatorio = math.Random();
    return numeroAleatorio.nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
        debugPrint("Chamando metodo build");
    return SafeArea( // evita que a AppBar fique atrás da barra de status
      child: Scaffold(
        extendBodyBehindAppBar: false, // garante que o corpo não sobreponha a AppBar
        appBar: AppBar(
          title: const Text("Meu app"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
            numeroGerado = _gerarNumeroAleatorio();
            });
          }),
        body: Center(
          child: Text(numeroGerado.toString()),
        
        ),
      ),
    );
  }
}
