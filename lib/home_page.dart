import 'package:flutter/material.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/pages/maps_example_one_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          children: [
            Text('Examples here'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MapsExampleOnePage.route);
              },
              child: const Text('Go to Maps Example One'),
            ),
          ],
        ),
      ),
    );
  }
}
