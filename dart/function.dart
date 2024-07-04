import 'dart:io';

void main() {
  var myName = uName();
  print(myName.username(156, 21));
}

class uName {
  num username(int no1, int no2) {
    return no1 + no2;
  }
}
