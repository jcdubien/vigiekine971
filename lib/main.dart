import 'package:flutter/material.dart';
import 'gardesBrain.dart';
import 'dates.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

GardesBrain gardesBrain=GardesBrain();
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
      )


      ,
      home: VeilleKinePage(title: 'Garde kiné du '+ dates.getDateProchaineGarde()),
    );
  }
}

class VeilleKinePage extends StatefulWidget {
  VeilleKinePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _VeilleKineState createState() => _VeilleKineState();
}

class _VeilleKineState extends State<VeilleKinePage> {

  String _textTest = 'Message whatsapp';
  String _customNews = 'Dernières news';





  @override

  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/logo.png"),

        actions: [
          IconButton(
              icon : const Icon(Icons.mail),
              tooltip: 'Envoyer un message à l équipe d organisation',
              onPressed: () {
                launch("mailto:urps971@gmail.com?subject=Questions concernant la veille respiratoire&body=Précisez Nom , Prénom , Coordonnées et Sujet ...");
              }),
        ],
        title: Text(widget.title),


      ),
      body: Center (


        child: Container(
        decoration: BoxDecoration(
      image:DecorationImage(
        image:AssetImage("assets/mapguadeloupe.jpg"),
          fit:BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[

              Expanded(

                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),

                    child: Column(
                      children: [
                        // Expanded(
                        //   child: Container(
                        //
                        //     child:Text('$_customNews',textAlign: TextAlign.center,style:TextStyle(fontSize: 20.0))
                        //   ),
                        // ),
                        Expanded(



                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      color:Colors.white60
                                    ),

                                    child: Text(

                                      'Les kinésithérapeutes de Guadeloupe assurent une veille respiratoire '
                                          'ce ' + dates.getDateProchaineGarde() +
                                          ' afin de surveiller , orienter , traiter , désencombrer '
                                          'les patients pédiatriques sur prescription médicale '
                                          'pour bronchiolite (jusqu\'à 2 ans), asthme aigu, '
                                          'pathologies neurologiques requérant une prise en charge'
                                              ' en kinésithérapie respiratoire les week-ends et jours fériés '
                                      ,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        )
                      ],
                    ),
                    ),
                  ),


              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      color:Colors.blueGrey,
                      elevation: 20.0,
                      // textColor: Colors.white,
                      // color: Colors.lightBlue,

                      child: Text(
                        'Grand Sud Caraïbe : '+gardesBrain.getCommuneGSC() ,

                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,

                        ),
                      ),
                    onPressed : () {
                      // FlutterOpenWhatsapp.sendSingleMessage(gardesBrain.getTelGSC(), "Requête de prise en charge en garde à "
                      //     + gardesBrain.getCommuneGSC()+" le " +dates.getDateProchaineGarde() + " ( PAS DE NOM ET DIAGNOSTIC PAR MESSAGERIE) :   " );

                      launch("tel://"+gardesBrain.getTelGSC());
                    },
                    //The user picked true.0
                  ),
                ),
              ),  Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      color:Colors.blueGrey,
                      elevation: 20.0,
                      // textColor: Colors.white,
                      // color: Colors.lightBlue,
                      child: Text(
                        'Riviera du levant : '+gardesBrain.getCommuneRVLEVANT(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        // FlutterOpenWhatsapp.sendSingleMessage(gardesBrain.getTelRVLEVANT(), "Requête de prise en charge en garde à "
                        //     + gardesBrain.getCommuneRVLEVANT()+" le " +dates.getDateProchaineGarde() + " ( PAS DE NOM ET DIAGNOSTIC PAR MESSAGERIE) :   ");

                        launch("tel://"+gardesBrain.getTelRVLEVANT());
                      }
                    //The user picked true.0
                  ),
                ),
              ),  Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      color:Colors.blueGrey,
                      elevation: 20.0,
                      // textColor: Colors.white,
                      // color: Colors.lightBlue,
                      child: Text(
                        'Nord Grande Terre : '+gardesBrain.getCommuneNGT(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        // FlutterOpenWhatsapp.sendSingleMessage(gardesBrain.getTelNGT(), "Requête de prise en charge en garde à "
                        //     + gardesBrain.getCommuneNGT()+" le " +dates.getDateProchaineGarde() + "  ( PAS DE NOM ET DIAGNOSTIC PAR MESSAGERIE) :    ");
                        launch("tel://"+gardesBrain.getTelNGT());
                      }
                    //The user picked true.0
                  ),
                ),
              ),  Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      color:Colors.blueGrey,
                      elevation: 20.0,
                      // textColor: Colors.white,
                      // color: Colors.lightBlue,
                      child: Text(
                        'Cap Excellence : '+gardesBrain.getCommuneEXC(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        // FlutterOpenWhatsapp.sendSingleMessage(gardesBrain.getTelEXC(), "Requête de prise en charge en garde à "
                        //     + gardesBrain.getCommuneEXC()+" le " +dates.getDateProchaineGarde() + " ( PAS DE NOM ET DIAGNOSTIC PAR MESSAGERIE) :  ");
                        launch("tel://"+gardesBrain.getTelEXC());
                      }
                    //The user picked true.0
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    color:Colors.blueGrey,
                    elevation: 20.0,
                    
                    // color: Colors.lightBlue,
                    child: Text(
                      'Nord Basse-Terre : '+gardesBrain.getCommuneNBT(),
                      style: TextStyle(
                      fontSize: 20.0,
                        // color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      launch("tel://"+gardesBrain.getTelNBT());
                      // FlutterOpenWhatsapp.sendSingleMessage(gardesBrain.getTelNBT(), "Requête de prise en charge en garde à "
                      //     + gardesBrain.getCommuneNBT()+" le " +dates.getDateProchaineGarde() + " ( PAS DE NOM ET DIAGNOSTIC PAR MESSAGERIE) :   ");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
