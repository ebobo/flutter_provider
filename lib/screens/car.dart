import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);
  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, provider, child) => Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.directions_car_outlined,
                  size: 50.0,
                ),
                const SizedBox(height: 100),
                const Text('This month you have used '),
                Text(
                  'car ${provider.totalCar} times',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'bus ${provider.totalBus} times',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'bicycle ${Provider.of<DataProvider>(context).totalBicycle} times',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => provider.cleanAll(),
              tooltip: 'Clean',
              child: const Icon(Icons.exposure_zero),
            ),
            const SizedBox(width: 170),
            FloatingActionButton(
              onPressed: () => provider.minusCar(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () => provider.addCar(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
