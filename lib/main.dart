import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/injection.dart' as di;
import 'package:route_task/presentation/cubit/product_cubit.dart';

import 'home_screen.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => di.sl<ProductCubit>()..fetchProducts(),
        child: HomeScreen(),
      ),
    );
  }
}
