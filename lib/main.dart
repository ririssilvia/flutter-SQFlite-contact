import 'package:flutter/material.dart';
import 'package:sqlite_crud/ui/list_kontak.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Kontak Sqlite',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ListKontakPage(),
    );
  }
}