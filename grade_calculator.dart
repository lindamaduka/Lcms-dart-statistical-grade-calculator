List<double> grades = [];

void addGrade(double grade) {
  if (grade >= 0 && grade <= 100) {
    grades.add(grade);
    print("Grade $grade added successfully!");
  } else {
    print(" Error: Grade must be between 0 and 100!");
  }
}

// Get the average of grades entered
double? calculateAverage() {
  if (grades.isEmpty) {
    return null; //
  }

  double sum = 0;
  for (var grade in grades) {
    sum = sum + grade; // Add each grade to the total
  }

  return sum / grades.length; // Divide sum of grades by amount of grades added
}

// Find the highest grade
double? findHighest() {
  if (grades.isEmpty) {
    return null;
  }

  double highest = grades[0];
  for (var grade in grades) {
    if (grade > highest) {
      highest = grade;
    }
  }
  return highest;
}

//  Find the lowest grade
double? findLowest() {
  if (grades.isEmpty) {
    return null;
  }

  double lowest = grades[0];
  for (var grade in grades) {
    if (grade < lowest) {
      lowest = grade;
    }
  }
  return lowest;
}

// Convert grade score number to letter grade
String getLetterGrade(double grade) {
  if (grade >= 90) {
    return 'A';
  } else if (grade >= 80) {
    return 'B';
  } else if (grade >= 70) {
    return 'C';
  } else if (grade >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

// Count how many letter grades exist
Map<String, int> getGradeDistribution() {
  Map<String, int> distribution = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'F': 0};
  for (var grade in grades) {
    String letter = getLetterGrade(grade);
    distribution[letter] = distribution[letter]! + 1;
  }

  return distribution;
}

// Show all number scores with their letter grades
void displayAllGrades() {
  if (grades.isEmpty) {
    print(" No grades yet! Add some first.");
    return;
  }

  print("\n All Grades:");
  print("─" * 30);
  for (int i = 0; i < grades.length; i++) {
    String letter = getLetterGrade(grades[i]);
    print("Student ${i + 1}: ${grades[i]} ($letter)");
  }
  print("─" * 30);
}

void displayStatistics() {
  if (grades.isEmpty) {
    print(" No grades yet! Add some first.");
    return;
  }

  print("\n Statistics:");
  print("─" * 30);
  print("Average: ${calculateAverage()!.toStringAsFixed(2)}");
  print("Highest: ${findHighest()}");
  print("Lowest: ${findLowest()}");
  print("Total Students: ${grades.length}");

  print("\n Grade Distribution:");
  Map<String, int> distribution = getGradeDistribution();
  distribution.forEach((letter, count) {
    print("$letter: $count students");
  });
  print("─" * 30);
}
