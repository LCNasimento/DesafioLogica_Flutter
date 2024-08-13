// lib/main.dart
import 'package:flutter/material.dart';
import 'services/corrida_service.dart';
import 'models/piloto.dart';
import 'models/volta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Resultado da Corrida'),
        ),
        body: Center(
          child: CorridaResultado(),
        ),
      ),
    );
  }
}

class CorridaResultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dados simulados
    final pilotos = [
      Piloto('038', 'F.MASSA', [
        Volta(1, Duration(seconds: 62, milliseconds: 852), 44.275),
        Volta(2, Duration(seconds: 63, milliseconds: 170), 44.053),
        Volta(3, Duration(seconds: 62, milliseconds: 769), 44.334),
        Volta(4, Duration(seconds: 62, milliseconds: 787), 44.321),
      ]),
      Piloto('033', 'R.BARRICHELLO', [
        Volta(1, Duration(seconds: 64, milliseconds: 352), 43.243),
        Volta(2, Duration(seconds: 64, milliseconds: 002), 43.480),
        Volta(3, Duration(seconds: 63, milliseconds: 716), 43.675),
        Volta(4, Duration(seconds: 64, milliseconds: 010), 43.474),
      ]),
      Piloto('002', 'K.RAIKKONEN', [
        Volta(1, Duration(seconds: 64, milliseconds: 108), 43.408),
        Volta(2, Duration(seconds: 63, milliseconds: 982), 43.493),
        Volta(3, Duration(seconds: 63, milliseconds: 987), 43.490),
        Volta(4, Duration(seconds: 63, milliseconds: 076), 44.118),
      ]),
      Piloto('023', 'M.WEBBER', [
        Volta(1, Duration(seconds: 64, milliseconds: 414), 43.202),
        Volta(2, Duration(seconds: 64, milliseconds: 805), 42.941),
        Volta(3, Duration(seconds: 64, milliseconds: 287), 43.287),
        Volta(4, Duration(seconds: 64, milliseconds: 216), 43.335),
      ]),
      Piloto('015', 'F.ALONSO', [
        Volta(1, Duration(seconds: 78, milliseconds: 456), 35.470),
        Volta(2, Duration(seconds: 67, milliseconds: 011), 41.528),
        Volta(3, Duration(seconds: 68, milliseconds: 704), 40.504),
        Volta(4, Duration(seconds: 80, milliseconds: 050), 34.763),
      ]),
      Piloto('11', 'S.VETTEL', [
        Volta(1, Duration(seconds: 181, milliseconds: 315), 13.169),
        Volta(2, Duration(seconds: 97, milliseconds: 864), 28.435),
        Volta(3, Duration(seconds: 78, milliseconds: 097), 35.633),
        // Piloto não completou a 4ª volta
      ]),
    ];

    final corridaService = CorridaService(pilotos);
    final resultado = corridaService.gerarResultado();

    return ListView.builder(
      itemCount: resultado.length,
      itemBuilder: (context, index) {
        final piloto = resultado[index];
        return ListTile(
          title: Text('${piloto['posicao']} - ${piloto['codigoPiloto']} '
              ' ${piloto['nomePiloto']}'),
          subtitle: Text('Voltas completadas: ${piloto['totalVoltas']}'
              ' '
              'Tempo Total: ${piloto['tempoTotal']}'),
        );
      },
    );
  }
}
