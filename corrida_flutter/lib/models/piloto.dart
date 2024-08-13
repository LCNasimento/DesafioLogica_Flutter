// lib/models/piloto.dart
import 'volta.dart';

class Piloto {
  final String codigo;
  final String nome;
  final List<Volta> voltas;

  Piloto(this.codigo, this.nome, this.voltas);

  // Calcula o tempo total de corrida
  Duration get tempoTotal =>
      voltas.fold(Duration.zero, (total, volta) => total + volta.tempoVolta);

  // Obtém a melhor volta do piloto
  Volta get melhorVolta =>
      voltas.reduce((a, b) => a.tempoVolta < b.tempoVolta ? a : b);

  // Calcula a velocidade média durante toda a corrida
  double get velocidadeMedia =>
      voltas.fold(
          0.0, (double total, Volta volta) => total + volta.velocidadeMedia) /
      voltas.length;

  // Método para obter a quantidade de voltas completadas
  int get totalVoltas =>
      voltas.isNotEmpty ? voltas.length : 0; // Garante que nunca será null
}
