import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:kurs4_bloc/presentation/home/cubit/home_cubit.dart';
import 'package:kurs4_bloc/presentation/home/view_models/home_view_model.dart';
import 'package:kurs4_bloc/presentation/home/views/home_view.dart';
import 'package:provider/provider.dart' as provider;

/// Provider => MVVM (Model, View, ViewModel)
/// bLoc => MVI

void main() {
  runApp(const MyApp());
}

/// State management

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: provider.ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: bloc.BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeView(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// value, znachenie
  /// [_counter] state = value
  int _counter = 0;

  /// State Management

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    log('_counter.....$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
