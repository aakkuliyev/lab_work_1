import 'dart:io';

void main() {
  double num1, num2, result;
  String operator;

  // Ввод первого числа
  stdout.write("Enter the first number: ");
  num1 = double.parse(stdin.readLineSync()!);

  // Ввод второго числа
  stdout.write("Enter the second number: ");
  num2 = double.parse(stdin.readLineSync()!);

  // Ввод оператора
  stdout.write("Enter the operator (+, -, *, /): ");
  operator = stdin.readLineSync()!;

  try {
    switch (operator) {
      case '+':
        result = add(num1, num2);
        break;
      case '-':
        result = subtract(num1, num2);
        break;
      case '*':
        result = multiply(num1, num2);
        break;
      case '/':
        result = divide(num1, num2);
        break;
      default:
        throw Exception("Invalid operator");
    }

    print("Result: $result");
  } catch (e) {
    print("Error: $e");
  }
}

double add(double a, double b) => a + b;

double subtract(double a, double b) => a - b;

double multiply(double a, double b) => a * b;

double divide(double a, double b) {
  if (b == 0) {
    throw Exception("Cannot divide by zero");
  }
  return a / b;
}

