

  String indiceZone;

String getIndiceZone(String zone) {


  switch(zone) {
case "Grand Sud Caraïbe": {  indiceZone='GSC'; }
break;

case "Riviéra du Levant": {  indiceZone='RVLEVANT'; }
break;

case "Nord Grande Terre": {  indiceZone='NGT'; }
break;

case "Nord Basse Terre": {  indiceZone='NBT'; }
break;

case "Cap Excellence": {  indiceZone='EXC';}
break;

default: { indiceZone='GSC'; }
break;
}
return indiceZone;
}
