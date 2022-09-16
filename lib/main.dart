import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/cart/bloc/cart_bloc.dart';
import 'module/home/bloc/fetch_data_bloc.dart';
import 'module/home/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => FetchDataBloc()..add(StartFetchEvent())),
          BlocProvider(create: (context) => CartBloc())
        ],
        child: MaterialApp(
          title: 'MT Ecom App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home(),
        ));
  }
}
