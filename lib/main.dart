import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Jardinero Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mi Jardinero Digital'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _plantName = '';
  String _temperature = '';
  String _humidity = 'Alta';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _plantName = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Ponle nombre a tu plantita'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  _temperature = value;
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: '¿Cuál es la temperatura ideal para tu planta (°C)?',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _humidity,
              onChanged: (String? value) {
                setState(() {
                  _humidity = value!;
                });
              },
              items: <String>['Alta', 'Mediana', 'Baja']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('Humedad: $value'),
                );
              }).toList(),
              hint: const Text('Selecciona la humedad ideal'),
            ),
          ],
        ),
      ),
    );
  }
}
