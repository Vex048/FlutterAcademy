//Zadanie 1 printerError
String zad1(String s){
  return ('${s.toLowerCase().split("").where((w) => w.codeUnitAt(0) > "m".codeUnitAt(0)).length}/${s.length}');
}

// Zadanie 2 Exes and Ohs - 1 metoda
bool zad2_1(String s){
  var ct = 0;
  for (var c in s.toLowerCase().split("")){
    if (c == 'o'){
      ct+=1;
    }
    else if (c == 'x') {
      ct -=1;
    }
  }
  if (ct != 0) {
    return false;
  }
  else {
    return true;
  }
}

// Zadanie 2 Exes and Ohs - 2 metoda
bool zad2_2(String s) {
  if (s.toLowerCase().split("").where((c) => c=='x').length == s.toLowerCase().split("").where((w) => w=='o').length){
    return true;
  }
  else{
    return false;
  }
}
// Zadanie 2 Exes and Ohs - 3m etoda
bool zad2_3(String s){
  return s.toLowerCase().split("").where((c) => c=='x').length == s.toLowerCase().split("").where((w) => w=='o').length ? true : false;
}

//zadanie 3 Simple remove duplicates
List<int> zad3(List<int> l){
  // set zbiera tylko pierwsza wartosc numery z listy, wiec trzeba odwrocic, aby trzymal tylko ostanie
  return l.reversed.toSet().toList().reversed.toList();
}




//zadanie 4 Fix String case
String zad4(String s){
  int counterUpperCase = s.split("").where((c) => c.codeUnitAt(0) <= 90).length;
  if (counterUpperCase > (s.length / 2)){
    return s.toUpperCase();
  }
  else {
    return s.toLowerCase();
  }
}

//zadanie 5 Valid Spacing
bool zad5(String s){
  if (s != s.trim()) return false;// Trim nie działa pomiędzy wyrazami i usuwa też \n i \t i trzeba jeszcze contains z dwoma spacjami
  if (s.contains('  ')) return false; 
  return true;
  
}


void testZad5(List<String> l){
  l.forEach((s) => print(zad5(s)));
}

//zadanie 6 Row Weights 
List<int> zad6(List<int> numbers){
  final List<int> newList = [0,0];
  for (int i=0; i< numbers.length; i++){
    (i%2 == 0) ? newList[0] = newList[0]! + numbers.elementAt(i) : newList[1] = newList[1]! + numbers.elementAt(i);
  }
  return newList;
}

// zadanie 7 - Counting Duplicates
void zad7(String s){
  Map<String,int> dict = {};
  for (String char in s.toLowerCase().split("")){
    if (dict.containsKey(char)) {
      // Wyrzknyik musi byc, poneiwaz nie mozna wykonac operacji + na null(a dict[char] moze byc nullem)
      dict[char] = dict[char]! + 1;
    }
    else {
      dict[char] = 1;
    }
  }
  print(dict.values.where((c) => c>1).length);
}


// zadanie 8 - New Cashier Does Not Know About Space or Shift
void zad8(String s) {
  Map<String,int> menu = {"Burger":0,'Fries':0,"Chicken":0, "Pizza":0,"Sandwich":0,"Onionrings":0,"Milkshake":0,"Coke":0};
  String item = '';
  for (String char in s.split("")){
    if (item.length == 0){
    item = item + char.toUpperCase();
    }
    else{
    item = item + char;
    }
    if (menu.containsKey(item)){
      menu[item] = menu[item]! + 1;
      item = '';
    }
  }
    String result = '';
    menu.forEach((key, value){
      result = result + '${(key + ' ' )*value}';
    });
    print(result.trim());
}
// Zadanie 9 - Meeting
void zad9(String s){
  String upper = s.toUpperCase();
  List<String> friends = upper.split(";");
  for (int i=0; i<friends.length;i++){
    String formated_name = '(${friends[i].split(":").reversed.join(", ")})'.trim();
    friends[i] = formated_name;
  }
  friends.sort();
  print(friends.join(""));
  return;
}


// Takie małe testowanie rozwiązań przed wrzucaniem tego na CodeWars
void main() {
  var s="aaabbbbhaijjjm";
 print(zad1(s));

var s2="aaaxbbbbyyhwawiwjjjwwm";
print(zad1(s2));

   print("-"*20);

 String szad2_1 = "ooxXm";
 String szad2_2 = "zpzpzpp";
 String szad2_3 = "zzoo";
  print(zad2_1(szad2_1));
  print(zad2_1(szad2_2));
  print(zad2_1(szad2_3));

  print("-"*20);
  print(zad2_2(szad2_1));
  print(zad2_2(szad2_2));
  print(zad2_2(szad2_3));

  print("-"*20);
  print(zad2_3(szad2_1));
  print(zad2_3(szad2_2));
  print(zad2_3(szad2_3)); 

  List<int> l1 = [3,4,4,3,6,3];
  List<int> l2 = [2,3,4,5,6,8,9,0,1,1,3,4,5,7,5,4,3]; 
  List<int> l3 = [0,0,0,0,1,1,1,1,2,2,3,4,4,5,6,7,8,9];
  print(zad3(l1));
  print(zad3(l2));
  print(zad3(l3));
    print("-"*20);
  String s41 = 'coDe';
  String s42 = 'CODe';
  String s43 = 'coDE';
  print(zad4(s41));
  print(zad4(s42));
  print(zad4(s43));
    print("-"*20);
  String s51 = 'Hello world';
  String s52 = ' Hello world';
  String s53 = 'Hello world  ';
  String s54 = 'Hello  world';
  String s55 = 'Hello';
  String s56 = 'Helloworld';
  String s57 = 'Helloworld ';
  String s58 = ' ';
  String s59 = '';
  List<String> l5 = [s51,s52,s53,s54,s55,s56,s57,s58,s59];
  testZad5(l5);
List<int> l61 = [13, 27, 49];
List<int> l62 = [50, 60, 70, 80];
List<int> l63 = [80];
    print("-"*20);
  print(zad6(l61));
  print(zad6(l62));
  print(zad6(l63));
    print("-"*20);
  zad7("abcde");
  zad7("indivisibility");
  zad7("Indivisibilities");
  zad7("aabbcde");
  print("-"*20);
  zad8("milkshakepizzachickenfriescokeburgerpizzasandwichmilkshakepizza");
    print("-"*20);
  zad9("Fred:Corwill;Wilfred:Corwill;Barney:Tornbull;Betty:Tornbull;Bjon:Tornbull;Raphael:Corwill;Alfred:Corwill");
}