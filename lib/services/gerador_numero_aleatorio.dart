import 'dart:math' as math;

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio(int numMax) {
    math.Random numeroAleatorio = math.Random();
    return numeroAleatorio.nextInt(numMax);
  }

}