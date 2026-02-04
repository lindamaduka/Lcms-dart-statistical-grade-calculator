import 'dart:io';
import 'grade_calculator.dart';

void clearScreen() {
  print('\x1B[2J\x1B[0;0H');
}

void showMenu() {
  print("\n Grade Calculator");
  print("═" * 30);
  print("1. Add Grade");
  print("2. View All Grades");
  print("3. View Statistics");
  print("4. Exit");
  print("═" * 30);
  stdout.write("Choose an option (1-4): ");
}

void main() {
  print("Welcome to your Grade Calculator!");

  bool running = true;

  // Keep showing menu until user wants to exit
  while (running) {
    showMenu();
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Add a new grade
      stdout.write("\nEnter grade (0-100): ");
      String? input = stdin.readLineSync();

      // Try to convert to number
      double? grade = double.tryParse(input ?? '');

      if (grade == null) {
        print("That's not a valid number! Try again.");
      } else {
        addGrade(grade);
      }

      // Wait for user to press Enter
      stdout.write("\nPress Enter to continue...");
      stdin.readLineSync();
    } else if (choice == '2') {
      displayAllGrades();
      stdout.write("\nPress Enter to continue...");
      stdin.readLineSync();
    } else if (choice == '3') {
      displayStatistics();
      stdout.write("\nPress Enter to continue...");
      stdin.readLineSync();
    } else if (choice == '4') {
      print("\n Thank you for using Grade Calculator!");
      running = false;
    } else {
      print("Invalid choice! Please pick 1, 2, 3, or 4.");
      stdout.write("\nPress Enter to continue...");
      stdin.readLineSync();
    }
  }
}
