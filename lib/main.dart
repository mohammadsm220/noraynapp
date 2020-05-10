import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Activtes_Screen.dart';
import 'Screens/NoraynScreen.dart';
import 'Screens/Selas_Screen.dart';
import 'Screens/Text_Screen.dart';
import 'Screens/loadingScreen.dart';
import 'Screens/homeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Service/Suggestions.dart';
import 'app_loxalization.dart';
import 'package:noraynapp/Service/Data.dart';
import 'package:noraynapp/Service/DatabaseService.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:noraynapp/Service/ImageService.dart';
import 'Service/SalesService.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Firestore
    final DatabaseService _db = DatabaseService();
    final ImageService _imageS = ImageService();
    final SalesService _salesStream = SalesService();
    // final Data _dbData =Data();
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (BuildContext context) => _db.streamNews(),
        ),
        StreamProvider(
          create: (BuildContext context) => _imageS.streamImages(),
        ),
        StreamProvider(
          create: (BuildContext context) => _salesStream.streamImages(),
        ),
        ChangeNotifierProvider(
          create: (context) => Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Suggestions(),
        ),
      ],
      child: MaterialApp(
        //The list of supported lang in the app
        supportedLocales: [
          Locale('ar', 'SA'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeListResolutionCallback: (locale, supportedLocales) {
          return supportedLocales.first;
        },
        initialRoute: 'LoadingScreen',
        routes: {
          'LoadingScreen': (context) => LoadingScreen(),
          'HomeScreen': (context) => HomeScreen(),
          'TextScreen': (context) => TextScreen(),
          'SalesScreen': (context) => Sales(),
          'ActivitesScreen': (context) => Activites(),
          'NoeaynScreen': (context) => Noeayn(),
          
        },
      ),
    );
  }
}
