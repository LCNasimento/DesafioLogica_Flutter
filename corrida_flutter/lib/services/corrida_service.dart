// lib/services/corrida_service.dart
import '../models/piloto.dart';
import '../models/volta.dart';

class CorridaService {
  final List<Piloto> pilotos;

  CorridaService(this.pilotos);

  List<Piloto> ordenarPorTempo() {
    return pilotos..sort((a, b) => a.tempoTotal.compareTo(b.tempoTotal));
  }

  Piloto obterVencedor() {
    return ordenarPorTempo().first;
  }

  Volta melhorVoltaGeral() {
    return pilotos
        .expand((piloto) => piloto.voltas)
        .reduce((a, b) => a.tempoVolta < b.tempoVolta ? a : b);
  }

  List<Map<String, dynamic>> gerarResultado() {
    final vencedores = ordenarPorTempo();
    final melhorVolta = melhorVoltaGeral();
    final resultado = vencedores.map((piloto) {
      final tempoAtraso = piloto.tempoTotal - vencedores.first.tempoTotal;
      return {
        'posicao': vencedores.indexOf(piloto) + 1,
        'codigoPiloto': piloto.codigo,
        'nomePiloto': piloto.nome,
        'tempoTotal':
            '${piloto.tempoTotal.inMinutes}:${(piloto.tempoTotal.inSeconds % 60).toString().padLeft(2, '0')}',
        'melhorVolta': piloto.melhorVolta.tempoVolta.inSeconds,
        'tempoAtraso': tempoAtraso.inSeconds,
      };
    }).toList();

    print(
        "Melhor Volta Geral: ${melhorVolta.tempoVolta.inSeconds} segundos pelo piloto ${melhorVolta.numeroVolta}");

    return resultado;
  }
}
