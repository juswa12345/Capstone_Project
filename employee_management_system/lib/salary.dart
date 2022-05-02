import 'dart:io';
import 'package:employee_management_system/person.dart';
import 'package:employee_management_system/account.dart';
import 'package:employee_management_system/interface.dart';
import 'package:employee_management_system/admin.dart';

class Salary extends Person{
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
  @override
  setStrings(String fname, String lname, String dept, String position, String add, String gender, String birthday, String email, String contactNum, String status, String levelOfAcc) {
    // TODO: implement setStrings
    return super.setStrings(fname, lname, dept, position, add, gender, birthday, email, contactNum, status, levelOfAcc);
  }
  List<String> departments = ['Administrative', 'Information technology', 'Purchasing and operations', 'Finance', 'Customer service', 'Sales'];

  List<Map<String, dynamic>> positions = [{
    'Administrative assistant' : 50000,
    'Secretary' : 45000,
    'Executive assistant' : 34000,
    'Office manager' : 75000,
  }, {
    'Computer programmer' : 30000,
    'Web developer' : 45000,
    'Software architect' : 50000,
    'Computer systems manager' : 50000,
  }, {
    'Purchasing manager' : 40000,
    'Logistics supervisor' : 45000,
    'Supply chain supervisor' : 30000,
    'Procurement director' : 37000,
  }, {
    'Benefits administrator' : 45000,
    'Accountant' : 20000,
    'Auditor' : 20000,
    'Payroll manager' : 35000,
  }, {
    'Customer service associate' : 45000,
    'Technical support specialist' : 25000,
    'Help desk coordinator' : 30000,
    'Customer service manager' : 30000,
  }, {
    'Administrative assistant' : 45000,
    'Secretary' : 25000,
    'Executive assistant' : 45000,
    'Office manager' : 30000,
  },];
}
void editEmpSalary(){
  bool choice = true;
  do {
    print('Select Department and Position you want to Edit: ');
    print('---------------------------------');
    int index = 1;
    salary.departments.forEach((dpt) {
      print('[$index] ${dpt}');
      index += 1;
    });
    print('---------------------------------');
    dept = int.parse(stdin.readLineSync()!);
    print('Select Position: ');
    index = 1;
    salary.positions[dept - 1].forEach((pos, sal) {
      print('[$index] $pos');
      index += 1;
    });
    print('---------------------------------');
    position = int.parse(stdin.readLineSync()!);
    print('|    POSITION   -   SALARY    |');
    print('${salary.positions[dept - 1].keys.elementAt(position - 1)} : ${salary
        .positions[dept - 1].values.elementAt(position - 1)}');
    print('Enter new Salary Amount for ${salary.positions[dept - 1].keys
        .elementAt(position - 1)}');
    dynamic newAmount = int.parse(stdin.readLineSync()!);
    salary.positions[dept - 1][salary.positions[dept - 1].keys.elementAt(position - 1)] = newAmount;
    print('Successfully Editted!');
    print('${salary.positions[dept - 1].keys.elementAt(position - 1)} : ${salary
        .positions[dept - 1].values.elementAt(position - 1)}');
    print('Do you want to continue to Edit Salary? [Y][N]');
    String pick = stdin.readLineSync()!.toUpperCase();
    (pick == 'N') ? choice = false
        : (pick == 'Y') ? choice = true : print('not in the choices');
  } while (choice);
}

void updateSalary(){
  print('UPDATE DEPARTMENT AND POSITION with SALARY');
  String choice = '';
  do {
    print('ADD NEW DEPARTMENT?[Y][N]');
    choice = stdin.readLineSync()!.toUpperCase();
    if(choice == 'Y') {
      print('---------------------------------');
      int index = 1;
      salary.departments.forEach((dpt) {
        print('[$index] ${dpt}');
        index += 1;
      });
      print('---------------------------------');
      print('Enter New Department: ');
      String newDept = stdin.readLineSync()!;
      salary.departments.add(newDept);
      print('New Department Added...');
      print('---------------------------------');
      index = 1;
      salary.departments.forEach((dpt) {
        print('[$index] ${dpt}');
        index += 1;
      });
      print('---------------------------------');
    }
  } while (choice != 'N');
  do {
    print('ADD NEW POSITION?[Y][N]');
    choice = stdin.readLineSync()!.toUpperCase();
    if(choice == 'Y') {
      print('Select Department:');
      print('---------------------------------');
      int index = 1;
      salary.departments.forEach((dpt) {
        print('[$index] $dpt');
        index += 1;
      });
      print('---------------------------------');
      dept = int.parse(stdin.readLineSync()!);
      print('---------------------------------');
      if(salary.positions.length == salary.departments.length){
        index = 1;
        salary.positions[dept - 1].forEach((pos, sal) {
          print('[$index] $pos');
          index += 1;
        });
      } else {
        print('No Records Yet!');
      }
      print('---------------------------------');
      print('Enter New Postion: ');
      String newPostion = stdin.readLineSync()!;
      print('Enter Salary: ');
      int newSalary = int.parse(stdin.readLineSync()!);
      (salary.positions.length == salary.departments.length)
          ? salary.positions[dept - 1].addAll({newPostion : newSalary})
          : salary.positions.add({newPostion : newSalary});
      print('New Department Added...');
      print('---------------------------------');
      index = 1;
      salary.positions[dept - 1].forEach((pos, sal) {
        print('[$index] $pos');
        index += 1;
      });
      print('---------------------------------');
    }
  } while (choice != 'N');
}

void viewSalary(){
  print('---------------------------------');
  int index = 1;
  salary.departments.forEach((dpt) {
    print('$dpt DEPARTMENT');
    int inner = 1;
    print('---------------------------------');
    salary.positions[index - 1].forEach((pos, sal) {
      print('[$inner] $pos : $sal');
      inner += 1;
    });
    print('---------------------------------');
    index += 1;
  });
  print('---------------------------------');
  print('PRESS ENTER TO CONTINUE');
  stdin.readLineSync();
}