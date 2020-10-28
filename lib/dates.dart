
import 'package:date_format/date_format.dart';

class Dates {




  List<DateTime> _gardesBank = [
    DateTime.utc(2020, 10, 25),
    DateTime.utc(2020, 11, 1),
    DateTime.utc(2020, 11, 2),
    DateTime.utc(2020, 11, 8),
    DateTime.utc(2020, 11, 11),
    DateTime.utc(2020, 11, 15),
    DateTime.utc(2020, 11, 22),
    DateTime.utc(2020, 11, 29),
    DateTime.utc(2020, 12, 6),
    DateTime.utc(2020, 12, 13),
    DateTime.utc(2020, 12, 20),
    DateTime.utc(2020, 12, 24),
    DateTime.utc(2020, 12, 25),
    DateTime.utc(2020, 12, 27),
    DateTime.utc(2021, 1, 1),
    DateTime.utc(2021, 1, 3),
    DateTime.utc(2021, 1, 10),
    DateTime.utc(2021, 1, 17),
    DateTime.utc(2021, 1, 24),
    DateTime.utc(2021, 1, 31),
    DateTime.utc(2021, 2, 7),
    DateTime.utc(2021, 2, 14),
    DateTime.utc(2021, 2, 16),
    DateTime.utc(2021, 2, 17),
    DateTime.utc(2021, 2, 21),
    DateTime.utc(2021, 2, 28),
    DateTime.utc(2021, 3, 7),
    DateTime.utc(2021, 3, 14),
    DateTime.utc(2021, 3, 21),
    DateTime.utc(2021, 3, 28),
  ];

  int _quelleDate() {

    int numeroGarde = 0;
    DateTime now = DateTime.now();
    bool isFirstCloser=true;

    for (int i = 0; i < _gardesBank.length; i++) {
      if (_gardesBank[i].isAfter(now) || _gardesBank[i].isAtSameMomentAs(now)) {
        if (isFirstCloser)  {
          isFirstCloser = false;
          numeroGarde=i;
        }
      } else { isFirstCloser=true;
    }}
    return numeroGarde;
    }

    int getQuelleDate(){
    return _quelleDate();
    }

    String getDateProchaineGarde(){



            var dateTxt= formatDate(_gardesBank[_quelleDate()],[dd,'-',mm,'-',yyyy]);

            return dateTxt;





    }


}





