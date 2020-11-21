
import 'gardesBrain.dart';
import 'dates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'veillekine.dart';
import 'package:google_fonts/google_fonts.dart';

Dates dates=Dates();


void main() {
  runApp(VeilleKine());
}

class VeilleKine extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'VEILLE DE KINESITHERAPIE RESPIRATOIRE 2020 2021',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.ubuntuCondensedTextTheme(
          Theme.of(context).textTheme,
        ),       )
      ,

      home: VeilleKinePage(title: dates.getDateProchaineGarde()),
    );
  }
}
