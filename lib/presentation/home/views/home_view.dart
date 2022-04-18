import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:kurs4_bloc/presentation/home/controllers/home_controllers.dart';
import 'package:kurs4_bloc/presentation/home/cubit/home_cubit.dart';
import 'package:kurs4_bloc/presentation/home/view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final _homeViewModel = context.watch<HomeViewModel>();
    log('build.....');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Provider',
            ),
            Text(
              _homeViewModel.count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 34),
            const Text(
              'GetX',
            ),
            Obx(
              () => Text(
                _homeController.count.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 34),
            const Text(
              'Cubit (bLoc)',
            ),
            bloc.BlocBuilder<HomeCubit, int>(
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<HomeViewModel>().increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => _homeController.increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.abc),
            ),
            FloatingActionButton(
              onPressed: () => context.read<HomeCubit>().increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.ac_unit),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
