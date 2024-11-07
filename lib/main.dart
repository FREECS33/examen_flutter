import 'package:examen_flutter/modules/auth/screens/create_account.dart';
import 'package:examen_flutter/modules/auth/screens/login.dart';
import 'package:examen_flutter/modules/expenses/screens/add_expense.dart';
import 'package:examen_flutter/navigation/expenses.dart';
import 'package:examen_flutter/navigation/profile.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
        '/expenses': (context) => const Expenses(),
        '/add-expense': (context) => const AddExpense(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
