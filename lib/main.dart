import 'package:estados/pages/pagina1_pages.dart';
import 'package:estados/pages/pagina2_pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => Pagina1Pages(),
        'pagina2': (_) => Pagina2Pages()
      },
    );
  }
}
