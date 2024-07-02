import 'dart:io';

//Write a program to convert celsius to fahrenheit

void main() {
  print("Enter celcius");
  double celsius = double.parse(stdin.readLineSync()!);
  double fahrenheit = (celsius * 9 / 5) + 32;
  print(fahrenheit);
}
