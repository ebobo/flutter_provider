import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/bicycle.dart';
import 'package:flutter_provider/screens/car.dart';
import 'package:flutter_provider/screens/bus.dart';
import 'package:flutter_provider/provider/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: DefaultTabController(
        length: 3,
        child: ChangeNotifierProvider(
          create: (context) => DataProvider(),
          builder: (context, child) => Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              title: const Text('Provider Demo'),
            ),
            body: const TabBarView(
              children: [CarPage(), BusPage(), BicyclePage()],
            ),
          ),
        ),
      ),
    );
  }
}
