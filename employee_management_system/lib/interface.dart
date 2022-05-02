import 'dart:io';
import 'package:employee_management_system/admin.dart';
import 'package:employee_management_system/person.dart';
import 'package:employee_management_system/account.dart';
import 'package:employee_management_system/salary.dart';
import 'package:xml/xml.dart';

List<Account> accounts = List.empty(growable: true);
List<Admin> employee = List.empty(growable: true);
String fName = '';
String lName = '';
String email = '';
String address = '';
String birthday = '';
String gender = '';
String contactNum = '';
int dept = 0;
int position = 0;
String status = 'ACTIVE';
String lvlOfAccess = 'EMPLOYEE';

String regUsername = '';
String regPassword = '';
String regEmail = '';

final salary = Salary();
void mainInterface(){
  String choice;
  do{
    print('---------------------');
    print('|   [A] Login       |');
    print('---------------------');
    print('|   [B] Register    |');
    print('---------------------');
    print('|    [Q] Exit       |');
    print('---------------------');
    choice = stdin.readLineSync()!.toUpperCase();
    (choice == 'A') ? selectLogin()
        : (choice == 'B') ? interfaceRegister()
        : (choice == 'Q') ? print('Exit') : print('Not in the Choices');
  } while (choice != 'Q');
}

void selectLogin(){
  String choice;
  do{
    print('---------------------');
    print('|     LOGIN AS      |');
    print('---------------------');
    print('|   [A] Admin       |');
    print('---------------------');
    print('|   [B] Employee    |');
    print('---------------------');
    print('|   [Q] Cancel      |');
    print('---------------------');
    choice = stdin.readLineSync()!.toUpperCase();
    (choice == 'A') ? {interfaceLogin('ADMIN')}
        : (choice == 'B') ? interfaceLogin('EMPLOYEE')
        : (choice == 'Q') ?  print('Canceled!') : print('Not in the Choices');
  } while (choice != 'Q');
}

void interfaceLogin(String container){
  int tries = 5;
  bool success = false;
  final admin = Admin();
  do {
    print('---------------------');
    print('|     Username:     |');
    print('---------------------');
    String username = stdin.readLineSync()!;
    print('---------------------');
    print('|     Password:     |');
    print('---------------------');
    String password = stdin.readLineSync()!;
    if(container == 'ADMIN') {
      for (int i = 1; i < admin.adminAccount.length; i++) {
        if (username == admin.adminAccount[0].values.elementAt(0) &&
            password == admin.adminAccount[0].values.elementAt(1)) {
          print('LOGGING IN AS SUPERADMIN!');
          tries = 0;
          success = true;
          adminMainInterface('SUPERADMIN');
        } else if (username == admin.adminAccount[i].values.elementAt(0) &&
            password == admin.adminAccount[i].values.elementAt(1)) {
          print('LOGGING IN AS ADMIN!');
          tries = 0;
          success = true;
          adminMainInterface('ADMIN');
        } else {
          tries -= 1;
          print('INCORRECT PASSWORD $tries try/s left!');
        }
      }
    } else {
      if (accounts.isNotEmpty) {
        for (int i = 0; i < accounts.length; i++) {
          if (username == accounts[i].username &&
              password == accounts[i].password) {
            print('LOGGING IN AS ${accounts[i].fullName}!');
            tries = 0;
            success = true;
          }
        }
      } else {
        tries -= 1;
        print('INCORRECT PASSWORD $tries try/s left!');
      }
    }

  } while (tries != 0 && success);
}

void interfaceRegister(){
  print('-----------REGISTER-----------');
  print('Enter First Name: ');
  fName = stdin.readLineSync()!;
  print('Enter Last Name: ');
  lName = stdin.readLineSync()!;
  print('Enter Email Address: ');
  bool isExisted = true;
  do {
    regEmail = stdin.readLineSync()!;
    if (accounts.isNotEmpty) {
      for (int i = 0; i < accounts.length; i++) {
        if (regEmail == accounts[i].email) {
          print('Email Already Taken! Enter Valid Email Address');
        } else {
          isExisted = false;
        }
      }
    }
  } while (isExisted);
  print('Enter Username: ');
  isExisted = true;
  do {
    regUsername = stdin.readLineSync()!;
    if (accounts.isNotEmpty) {
      for (int i = 0; i < accounts.length; i++) {
        if (regUsername == accounts[i].username) {
          print('Username Already Taken! Enter Valid Username');
        } else {
          isExisted = false;
        }
      }
    }
  } while (isExisted);
  print('Enter Password: ');
  regPassword = stdin.readLineSync()!;
  if(employee.isNotEmpty) {
    for (int i = 0; i < employee.length; i++) {
      if (regEmail == employee[i].email) {
        final create = Account();
        create.createAccount(
            regUsername, regPassword, '$fName $lName', regEmail);
        accounts.add(create);
        print(accounts);
      } else {
        print('Email not found on the Data base!');
      }
    }
  }
}

void adminManageInterface(){
  String choice;
  do {
    print('-----------------------');
    print('|   [A] Add Employee   |');
    print('-----------------------');
    print('| [B] Remove Employee  |');
    print('-----------------------');
    print('|  [C] Edit Employee   |');
    print('-----------------------');
    print('|  [D] View Employee   |');
    print('-----------------------');
    print('|       [Q] BACK       |');
    print('-----------------------');
    choice = stdin.readLineSync()!.toUpperCase();
    (choice == 'A') ? interfeceAddEmployee()
        : (choice == 'B') ? interfaceDeleteEmployee()
        : (choice == 'C') ? editEmployee()
        : (choice == 'D') ? interfaceViewEmployee() : print('');
  }while (choice != 'Q');
}

void interfaceManageSalary(){
  String choice;
  do {
    print('-----------------------------');
    print('|  [A] Edit Employee Salary  |');
    print('-----------------------------');
    print('|     [B] Update Salary      |');
    print('-----------------------------');
    print('|  [C] View Employee Salary  |');
    print('-----------------------------');
    print('|         [Q] BACK           |');
    print('-----------------------------');
    choice = stdin.readLineSync()!.toUpperCase();
    (choice == 'A') ? editEmpSalary()
        : (choice == 'B') ? updateSalary()
        : (choice == 'C') ? viewSalary() : print('');
  }while (choice != 'Q');
}

void adminMainInterface(String container){
  String choice;
  do {
    print('-----------------------');
    print('| [A] Manage Employee  |');
    print('-----------------------');
    print('|  [B] Manage Salary   |');
    print('-----------------------');
    print('|      [Q] Logout      |');
    print('-----------------------');
    choice = stdin.readLineSync()!.toUpperCase();
    (choice == 'A') ?
    (container == 'ADMIN') ? adminManageInterface() : superAdminInterface()
        : (choice == 'B') ? interfaceManageSalary() : print('');
  }while (choice != 'Q');
}

void superAdminInterface(){
  String choice;
  do {
    print('-------------------------');
    print('|    [A] Add Employee    |');
    print('-------------------------');
    print('|  [B] Remove Employee   |');
    print('-------------------------');
    print('|   [C] Edit Employee    |');
    print('-------------------------');
    print('|   [D] View Employee    |');
    print('-------------------------');
    print('| [E] Edit Admin Account |');
    print('-------------------------');
    print('|       [Q] Logout       |');
    print('-------------------------');
    choice = stdin.readLineSync()!.toUpperCase();
    (choice == 'A') ? interfeceAddEmployee()
        : (choice == 'B') ? interfaceDeleteEmployee()
        : (choice == 'C') ? editEmployee()
        : (choice == 'D') ? interfaceViewEmployee()
        : (choice == 'E') ? editAdminAccounts() : print('');
  }while (choice != 'Q');
}