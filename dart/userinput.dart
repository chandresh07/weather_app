import 'dart:io';

void main() {
  print("Enter Your Name");
  String? name = stdin.readLineSync();
  stdout.write("Enter Your age ");
  int number = int.parse(stdin.readLineSync()!);
  print("Your name is ${name} and your age is ${number}");
}
