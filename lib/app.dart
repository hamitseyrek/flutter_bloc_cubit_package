import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_cubit_package/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_cubit_package/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_cubit_package/counter_bloc/counter_state.dart';
import 'package:flutter_bloc_cubit_package/theme_cubit/theme_cubit.dart';

class MyAppHome extends StatelessWidget {
  const MyAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Use Bloc Package'),
      ),
      body: const MyCenterWidget(),
      floatingActionButton: const MyActions(),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the botton this many times'),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (contect, counterState) => Text(
                counterState.counter.toString(),
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class MyActions extends StatelessWidget {
  const MyActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.add),
          heroTag: 'add',
          onPressed: () {
            context.read<CounterBloc>().add(CounterIncrement());
          },
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          child: const Icon(Icons.remove),
          heroTag: 'decrease',
          onPressed: () {
            context.read<CounterBloc>().add(CounterDecrement());
          },
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          child: const Icon(Icons.brightness_6),
          heroTag: 'changeTheme',
          onPressed: () {
            context.read<ThemeCubit>().changeTheme();
          },
        ),
      ],
    );
  }
}
