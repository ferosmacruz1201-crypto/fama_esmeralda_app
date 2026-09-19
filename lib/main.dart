import 'package:flutter/material.dart';

void main() {
  runApp(const FamaLaEsmeraldaApp());
}

class FamaLaEsmeraldaApp extends StatelessWidget {
  const FamaLaEsmeraldaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fama y Charcutería La Esmeralda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const PanelAdmin(),
    );
  }
}

// Modelos de datos sencillos
class Gasto {
  final String concepto;
  final double monto;
  Gasto(this.concepto, this.monto);
}

class Fiado {
  final String nombreCliente;
  final double montoDebe;
  final String fechaLimite;
  Fiado(this.nombreCliente, this.montoDebe, this.fechaLimite);
}

class BaseDatosGlobal {
  static List<Gasto> gastos = [
    Gasto('Luz', 45000),
    Gasto('Matarife', 120000),
    Gasto('Guías', 15000),
  ];

  static List<Fiado> fiados = [
    Fiado('Carlos Pérez', 35000, '2026-09-25'),
    Fiado('Ana Gómez', 18000, '2026-09-28'),
  ];
}

class PanelAdmin extends StatefulWidget {
  const PanelAdmin({super.key});

  @override
  State<PanelAdmin> createState() => _PanelAdminState();
}

class _PanelAdminState extends State<PanelAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fama y Charcutería La Esmeralda'),
        backgroundColor: Colors.red[800],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Control de Gastos (Luz, Matarife, Guías)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...BaseDatosGlobal.gastos.map((g) => ListTile(
                title: Text(g.concepto),
                trailing: Text('\$${g.monto}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
              )),
          const Divider(height: 30),
          const Text(
            'Módulo de Fiados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...BaseDatosGlobal.fiados.map((f) => ListTile(
                title: Text(f.nombreCliente),
                subtitle: Text('Debe: \$${f.montoDebe} - Paga el: ${f.fechaLimite}'),
              )),
        ],
      ),
    );
  }
}
