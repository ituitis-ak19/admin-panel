import 'package:admin_ui/core/theme/app_theme.dart';
import 'package:admin_ui/screen/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('tr'), 
      ],
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Center(child: MainView()),
      ),
    );
  }
}