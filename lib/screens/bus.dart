import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/data_provider.dart';
import 'package:provider/provider.dart';

class BusPage extends StatefulWidget {
  const BusPage({Key? key}) : super(key: key);
  @override
  State<BusPage> createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Consumer<DataProvider>(
            builder: (context, provider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.directions_bus_outlined,
                  size: 50.0,
                ),
                const SizedBox(height: 100),
                const Text('This month you have used '),
                Text(
                  'car ${provider.totalCar} times',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'bus ${provider.totalBus} times',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'bicycle ${provider.totalBicycle} times',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                Provider.of<DataProvider>(context, listen: false).minusBus(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () =>
                Provider.of<DataProvider>(context, listen: false).addBus(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
