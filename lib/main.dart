import 'package:counter_app_using_stream/my_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyBloc bloc = MyBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Using Stream'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: StreamBuilder(
            stream: bloc.counterStream,
            builder: (context, snapshot) => Text(
              snapshot.hasData ? snapshot.data.toString() : '0',
              style: const TextStyle(fontSize: 40, color: Colors.greenAccent),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
