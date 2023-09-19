import 'package:flutter/material.dart';
import 'package:local_app/providers/auth_provider.dart';
import 'package:local_app/screens/home/food/food_screen.dart';
import 'package:local_app/screens/home/home_screen.dart';
import 'package:local_app/theme.dart';
import 'package:provider/provider.dart';
import 'screens/sign in/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
          theme: AppTheme.lightTheme(context),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => SignInScreen(),
            '/home': (context) => HomePage(),
          }),
    );
  }
}
