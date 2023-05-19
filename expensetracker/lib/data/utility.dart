import 'package:hive/hive.dart';
import '../data/model/add_date.dart';
import 'model/add_pre.dart';

int totals = 0;
double totals1 = 0.0;

final box = Hive.box<Add_data>('data');
final box2 = Hive.box<Add_pre>('pre');

int total() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].in_ == 'Ingreso'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].in_ == 'Ingreso' ? int.parse(history2[i].amount) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int expenses() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
        history2[i].in_ == 'Ingreso' ? 0 : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<Add_data> today() {
  List<Add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<Add_data> week() {
  List<Add_data> a = [];
  DateTime date = new DateTime.now();
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= history2[i].datetime.day &&
        history2[i].datetime.day <= date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<Add_data> month() {
  List<Add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<Add_data> year() {
  List<Add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.year == date.year) {
      a.add(history2[i]);
    }
  }
  return a;
}

int total_chart(List<Add_data> history2) {
  List a = [0, 0];

  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].in_ == 'Ingreso'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<Add_data> history2, bool hour) {
  List<Add_data> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].datetime.hour == history2[c].datetime.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].datetime.day == history2[c].datetime.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(total_chart(a));
    a.clear();
    c = counter;
  }
  print(total);
  return total;
}

double neto() {
  var history2 = box2.values.toList();
  var neto;
  List a = [0.0, 0.0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].in_ == 'Ingreso' ? int.parse(history2[i].amount) : 0);
  }
  neto = a.reduce((value, element) => value + element) * 0.105;
  totals1 = a.reduce((value, element) => value + element) - neto;
  return totals1;
}

double bruto() {
  var history2 = box2.values.toList();
  List a = [0.0, 0.0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].in_ == 'Ingreso'
        ? neto()
        : int.parse(history2[i].amount) * -1);
  }
  totals1 = a.reduce((value, element) => value + element);
  return totals1;
}

double extras() {
  var history2 = box2.values.toList();
  var salarioD;
  var salarioH;
  var extra;
  var horas;
  List a = [0.0, 0.0];
  List b = [0, 0];
  if (bruto() < 0) {
    for (var i = 0; i < history2.length; i++) {
      a.add(history2[i].in_ == 'Ingreso' ? int.parse(history2[i].amount) : 0);
      b.add(history2[i].in_ == 'Ingreso' ? int.parse(history2[i].horas) : 0);
    }
    salarioD = a.reduce((value, element) => value + element) / 30;
    salarioH = salarioD / b.reduce((value, element) => value + element);
    extra = salarioH * 1.5;
    horas = (bruto() / extra) * -1;
    totals1 = horas;
  } else {
    totals1 = 0.0;
  }

  return totals1;
}

int gastos() {
  var history2 = box2.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
        history2[i].in_ == 'Ingreso' ? 0 : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}
