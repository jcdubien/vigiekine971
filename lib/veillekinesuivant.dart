import 'dart:async';
// ignore: avoid_web_libraries_in_flutter


import 'package:flutter/material.dart';
import 'gardesBrain.dart';
import 'dates.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'veillekine.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

GardesBrain gardesBrain=GardesBrain();
Dates dates=Dates();

class VeilleKineSuivantPage extends StatefulWidget {
  VeilleKineSuivantPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _VeilleKineSuivantState createState() => _VeilleKineSuivantState();
}

class _VeilleKineSuivantState extends State<VeilleKineSuivantPage> {

  // List<String> presentation= [
  //   'Les kinésithérapeutes de Guadeloupe '
  //       'assurent une veille respiratoire chaque week-end et jour férié du '
  //       '1er Novembre au 31 mars , afin d\'assurer la continuité des soins '
  //       'à posologie quotidienne , en relais avec les kinésithérapeutes de '
  //       'semaine' ,
  //   'La profession , réunie autour du Conseil Départemental de l\'Ordre ,'
  //       ' de l\'URPS, et du Syndicat des Kinésithérapeutes de Guadeloupe , '
  //       'réaffirme sa solidarité avec l\'ensemble de la '
  //       'population Guadeloupéenne , ainsi que la communauté des '
  //       'soignants de Guadeloupe , de ville ou d\'hopital ',
  //   ' Les kinésithérapeutes de Guadeloupe ont pour '
  //       'mission  de surveiller , orienter ,traiter , désencombrer '
  //       'les patients de 0 à 15 ans présentant '
  //       'des affections respiratoires, sur prescription médicale 7 jours sur 7',
  //   'Votre kinésithérapeute recevra votre enfant '
  //       'pour bronchiolite (jusqu\'à 2 ans) avec vérification de constantes'
  //       ', bilan , désencombrement si nécessaire',
  //   'Votre kinésithérapeute prendra en charge les conséquences '
  //       'd\' un asthme aigu en contrôle , conseil et désencombrement si nécessaire',
  //   ' Votre kinésithérapeute prendra en charge les conséquences respiratoires '
  //       'd\'une pathologie neurologique  '
  //       'requérant une prise en charge en kinésithérapie avec ou sans '
  //       'désencombrement , avec ou sans utlisation d\'appareillages ventilatoires',
  //   'La veille respiratoire en kinésithérapie'
  //       ' se déroule chaque week-end de samedi midi à dimanche  '
  //       'et les jours fériés , en partenariat avec l\'ADGUPS et '
  //       'les médecins de Guadeloupe',
  // ];


  int i=0;
  int selecteurDate=0;
  bool isLast=false;
  bool isNext=false;


  void refreshWidget() {
    setState(() {
      (i<presentation.length-1)? i++ : i=0;
    });
  }

  @override

  void initState() {

    super.initState();
    const oneSecond = const Duration(seconds: 10);
    new Timer.periodic(oneSecond, (Timer t) => refreshWidget());
  }





  Widget build(BuildContext context) {

    //String textePresentation=textePresentation1;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/logo.png"),

        actions: [
          IconButton(
              icon : const Icon(Icons.mail),
              tooltip: 'Envoyer un message à l équipe d organisation',
              onPressed: () {
                launch("mailto:urps971@gmail.com?subject=Questions concernant la veille respiratoire");
              }),

          IconButton(
              icon : const Icon(Icons.phone),
              tooltip: 'Contacter le médecin régulateur',
              onPressed: () {
                launch("tel:0590901313");
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
                child : Center(
                    child: Text('Garde en kinésithérapie respiratoire 2020-2021',
                      style:
                      TextStyle(color: Colors.black,backgroundColor: Colors.white60, fontSize:20.0 ),
                      textAlign: TextAlign.center,


                    )
                ),

              ),


              Expanded(

                flex: 5,
                child: Column(
                  children: [

                    Expanded(

                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            decoration: BoxDecoration(
                                color:Colors.white60,
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text( presentation[i],

                                textAlign: TextAlign.center,

                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)
                    ),
                    color:Colors.blueGrey.withOpacity(0.50),
                    elevation: 20.0,

                    child: Text(
                      'Grand Sud Caraïbe : '+gardesBrain.getCommuneGSC(1).toUpperCase() ,
                      style: TextStyle(

                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: gardesBrain.getNomGSC(1).toUpperCase()+" "+gardesBrain.getPrenomGSC(1).toUpperCase(),
                        desc: "vous reçoit sur rendez-vous à "+gardesBrain.getCommuneGSC(1).toUpperCase()+" le " + dates.getDateSuivanteGarde().toUpperCase(),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "CONTACT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              launch("tel://"+gardesBrain.getTelGSC(1));
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    },
                    onLongPress : () {
                      launch("tel://"+gardesBrain.getTelGSC(1));
                    },

                  ),
                ),
              ),  Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                      color:Colors.blueGrey.withOpacity(0.50),
                      elevation: 20.0,

                      child: Text(
                        'Riviera du levant : '+gardesBrain.getCommuneRVLEVANT(1).toUpperCase(),
                        style: TextStyle(

                          fontSize: 20.0,
                        ),
                      ),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: gardesBrain.getNomRVLEVANT(1).toUpperCase()+" "+gardesBrain.getPrenomRVLEVANT(1).toUpperCase(),
                        desc: "vous reçoit sur rendez-vous à "+gardesBrain.getCommuneRVLEVANT(1).toUpperCase()+" le " + dates.getDateSuivanteGarde().toUpperCase(),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "CONTACT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              launch("tel://"+gardesBrain.getTelRVLEVANT(1));
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    },
                    onLongPress : () {
                      launch("tel://"+gardesBrain.getTelRVLEVANT(1));
                    },
                  ),
                ),
              ),  Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                      color:Colors.blueGrey.withOpacity(0.50),
                      elevation: 20.0,

                      child: Text(
                        'Nord Grande Terre : '+gardesBrain.getCommuneNGT(1).toUpperCase(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: gardesBrain.getNomNGT(1).toUpperCase()+" "+gardesBrain.getPrenomNGT(1).toUpperCase(),
                        desc: "vous reçoit sur rendez-vous à "+gardesBrain.getCommuneNGT(1).toUpperCase()+" le " + dates.getDateSuivanteGarde().toUpperCase(),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "CONTACT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              launch("tel://"+gardesBrain.getTelNGT(1));
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    },
                    onLongPress : () {
                      launch("tel://"+gardesBrain.getTelNGT(1));
                    },
                  ),
                ),
              ),  Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                      color:Colors.blueGrey.withOpacity(0.50),
                      elevation: 20.0,

                      child: Text(
                        'Cap Excellence : '+gardesBrain.getCommuneEXC(1).toUpperCase(),
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: gardesBrain.getNomEXC(1).toUpperCase()+" "+gardesBrain.getPrenomEXC(1).toUpperCase(),
                        desc: "vous reçoit sur rendez-vous à "+gardesBrain.getCommuneEXC(1).toUpperCase()+" le " + dates.getDateSuivanteGarde().toUpperCase(),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "CONTACT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              launch("tel://"+gardesBrain.getTelEXC(1));
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    },
                    onLongPress : () {
                      launch("tel://"+gardesBrain.getTelEXC(1));
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)
                    ),
                    color:Colors.blueGrey.withOpacity(0.50),
                    elevation: 20.0,

                    child: Text(
                      'Nord Basse-Terre : '+gardesBrain.getCommuneNBT(1).toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,

                      ),
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: gardesBrain.getNomNBT(1).toUpperCase()+" "+gardesBrain.getPrenomNBT(1).toUpperCase(),
                        desc: "vous reçoit sur rendez-vous à "+gardesBrain.getCommuneNBT(1).toUpperCase()+" le " + dates.getDateSuivanteGarde().toUpperCase(),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "CONTACT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              launch("tel://"+gardesBrain.getTelNBT(1));
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    },
                    onLongPress : () {
                      launch("tel://"+gardesBrain.getTelNBT(1));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment :MainAxisAlignment.spaceBetween,


          children: [
            IconButton(
              icon: Icon(Icons.first_page),

              color:Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return VeilleKinePage(title:  dates.getDateProchaineGarde());
                  }),
                );
              }
              ,
              tooltip: 'Garde précédente du '+dates.getDateProchaineGarde(),
            ),
            Text(dates.getDateProchaineGarde()),

          ],
        ),


      ),
    );
  }
}