import 'dart:collection';

void main(){
  var arrNew = ["1", "12", "2", "3", "4", "4", "2", "9", "3", "1", "6", "6", "7","21","21", "7", "9"];
  var test = Test();
  for(var item in arrNew){
    test.save(item);
  }
  print(test.firstUniqueVistor());
  var set = Set();
  set .addAll(arrNew);
  final x = set.toList();
  x.sort();
  print(set.toString());
  print(x);

}
class Test {
  var arr = <String>[];
  var hm = HashMap<String, int>();

  void save(String str) {
    if (arr.contains(str)) {
      hm[str] = 1;
    } else {
      hm[str] = 0;
    }
    arr.add(str);
  }

  String? firstUniqueVistor() {
    for (var item in hm.keys) {
      if (hm[item] == 0) {
        return item;
      }
    }
    return null;
  }
}

