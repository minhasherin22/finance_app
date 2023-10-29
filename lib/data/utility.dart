import 'package:finance_app/modal/add_data.dart';
import 'package:hive/hive.dart';

int totals = 0;
final box = Hive.box<Add_data>('data');


int total(){
  var history2 = box.values.toList();
  List a = [0,0];
  for(var i = 0;i<history2.length;i++){
    a.add(history2[i].IN == 'Income'
    ?int.parse(history2[i].amount)
    :int.parse(history2[i].amount)*-1
    );
  }
   totals = a.reduce((value, element) => value + element);
  return totals;
}


int income(){
     var history2 = box.values.toList();
     List a = [0,0];
     for(var i = 0; i<history2.length;i++){
      a.add(history2[i].IN == 'Income'? int.parse(history2[i].amount):0);
     }
     totals = a.reduce((value, element) => value+element);
     return totals;
}

int expense(){
  var history2 = box.values.toList();
  List a = [0,0];
  for(var i =0;i<history2.length;i++){
    a.add(history2[i].IN == 'Income' ? 0 :int.parse(history2[i].amount)*-1);
  }
  totals = a.reduce((value, element) => value+element);
  return totals;
}

// List<Add_data>today(){
//   List<Add_data> a =[];
//    DateTime date =  DateTime.now();
//   var history2 = box.values.toList();
//   for(var i = 0;i<history2.length;i++){
//    if(history2[i].datetime.day == date.day ){
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }

// List<Add_data> week() {
//   List<Add_data> a = [];
//   DateTime date = new DateTime.now();
//   var history2 = box.values.toList();
//   for (var i = 0; i < history2.length; i++) {
//     if (date.day - 7 <= history2[i].datetime.day &&
//         history2[i].datetime.day <= date.day) {
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }

// List<Add_data> month() {
//   List<Add_data> a = [];
//   var history2 = box.values.toList();
//   DateTime date = new DateTime.now();
//   for (var i = 0; i < history2.length; i++) {
//     if (history2[i].datetime.month == date.month) {
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }