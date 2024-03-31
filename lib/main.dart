import 'package:flutter/material.dart';
import 'package:ai_test/presentation/main/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const MainPage(),
      ),
    ),
  );
}
