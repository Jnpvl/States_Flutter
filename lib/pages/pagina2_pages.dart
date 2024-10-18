import 'package:flutter/material.dart';

class Pagina2Pages extends StatelessWidget {
  const Pagina2Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer usuario'),
              onPressed: () {},
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad'),
              onPressed: () {},
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer profesion'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
