import 'package:evdemoapp/providers/change_provider.dart';
import 'package:evdemoapp/providers/charging_provider.dart';
import 'package:evdemoapp/providers/login_provider.dart';
import 'package:evdemoapp/providers/navigation_provider.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:evdemoapp/providers/toggal_provider.dart';
import 'package:evdemoapp/providers/tr_provider.dart';
import 'package:evdemoapp/views/login_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const FirebaseOptions firebaseOptions = FirebaseOptions(
    apiKey: 'AIzaSyBtLgFB4Qva48b459gpxCj0F0-Ep7hZFJg',
    appId: '1:447282651098:android:25453e16f023cbea986ae3',
    messagingSenderId: '447282651098',
    projectId: 'demoapp-fe1ed',
  );
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ToggleProvider()),
        ChangeNotifierProvider(create: (context) => ChargingStationProvider()),
        ChangeNotifierProvider(create: (context) => ChargeInfoProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const LoginScreen(),
        );
      },
    );
  }
}
