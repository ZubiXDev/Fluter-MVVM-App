import 'package:bingo/utils/routes/routes.dart';
import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/view_model/auth_view_model.dart';
import 'package:bingo/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Bingo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            color: Colors.teal,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.gerenrateRoute,
      ),
    );
  }
}
