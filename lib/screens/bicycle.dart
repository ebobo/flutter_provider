import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/data_provider.dart';
import 'package:provider/provider.dart';

class BicyclePage extends StatefulWidget {
  const BicyclePage({Key? key}) : super(key: key);
  @override
  State<BicyclePage> createState() => _BicyclePageState();
}

class _BicyclePageState extends State<BicyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.directions_bike_outlined,
                size: 50.0,
              ),
              const SizedBox(height: 100),
              const Text('This month you have used '),
              Text(
                'car ${Provider.of<DataProvider>(context).totalCar} times',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'bus ${Provider.of<DataProvider>(context).totalBus} times',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'bicycle ${Provider.of<DataProvider>(context).totalBicycle} times',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => Provider.of<DataProvider>(context, listen: false)
                .minusBicycle(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () =>
                Provider.of<DataProvider>(context, listen: false).addBicycle(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
