import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DilData with ChangeNotifier {
  ThemeMode temaSecimi = ThemeMode.light;

  void _temaDegistir() {
    if (temaSecimi == ThemeMode.light) {
      temaSecimi = ThemeMode.dark;
    } else {
      temaSecimi = ThemeMode.light;
    }
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DilData>(
          create: (BuildContext context) => DilData(),
        ),
      ],
      child: Consumer<DilData>(
        builder: (context, provider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: Provider.of<DilData>(context).temaSecimi, //temaSecimi,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.grey,
            accentColor: Colors.black,
            primaryColorLight: Colors.white,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.deepPurple,
            accentColor: Colors.deepPurple,
            primaryColorLight: Colors.white,
          ),
          home: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tema Değişimi",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Lorem Ipsum",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 30.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DigerSayfa()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).accentColor,
                ),
              ),
              child: Text(
                "Ayarlar Sayfası",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DigerSayfa extends StatefulWidget {
  const DigerSayfa({Key? key}) : super(key: key);

  @override
  _DigerSayfaState createState() => _DigerSayfaState();
}

class _DigerSayfaState extends State<DigerSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ayarlar",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<DilData>(context, listen: false)._temaDegistir();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).accentColor,
            ),
          ),
          child: Text(
            "Temayı Değiştir",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
      ),
    );
  }
}

/*

      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<DilData>(context).temaSecimi, //temaSecimi,
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.red,
        primaryColor: Colors.yellow,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.purple,
        primaryColor: Colors.blue,
      ),

onPressed: () {
            Provider.of<DilData>(context, listen: false)._temaDegistir();
          }, //

 */