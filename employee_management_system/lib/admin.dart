import 'package:xml/xml.dart';
import 'dart:io';
import 'package:employee_management_system/person.dart';
import 'package:employee_management_system/interface.dart';
import 'package:employee_management_system/salary.dart';
import 'package:employee_management_system/employee.dart';

class Admin extends Person{

  List<Map<String, String>> adminAccount = [{
    'username' : 'superadmin',
    'password' : 'superadmin',
    'email' : 'superadmin@gmail.com',
  }, {
    'username' : 'admin123',
    'password' : 'adminadmin',
    'email' : 'admin@gmail.com',
  }];

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
  @override
  setStrings(String fname, String lname, String dept, String position, String add,  String gender, String birthday, String email, String contactNum, String status, String levelOfAcc) {
    // TODO: implement setStrings
    return super.setStrings(fname, lname, dept, position, add,  gender, birthday, email, contactNum, status, levelOfAcc);
  }

}

final admin = Admin();

void interfeceAddEmployee(){
  final emp = Admin();
  print('-----------ADD EMPLOYEE-----------');
  print('Enter First Name: ');
  fName = stdin.readLineSync()!;
  print('Enter Last Name: ');
  lName = stdin.readLineSync()!;
  print('Enter Email Address: ');
  email = stdin.readLineSync()!;
  print('Enter Gender: ');
  gender = stdin.readLineSync()!;
  print('Enter contact number: ');
  contactNum = stdin.readLineSync()!;
  print('Enter Birthday: ');
  birthday = stdin.readLineSync()!;
  print('Enter Address: ');
  address = stdin.readLineSync()!;
  print('Select Department: ');
  int index = 1;
  salary.departments.forEach((dpt){
    print('[$index] ${dpt}');
    index+=1;
  });
  do {
    dept = int.parse(stdin.readLineSync()!);
    (dept > salary.departments.length) ? print('NOT IN THE CHOICES') : '';
  } while(dept > salary.departments.length);
  print('Select Position: ');
  index = 1;
  salary.positions[dept - 1].forEach((pos, sal) {
    print('[$index] $pos');
    index+=1;
  });
  do {
    position = int.parse(stdin.readLineSync()!);
    (position > salary.positions[dept - 1].length) ? print('NOT IN THE CHOICES') : '';
  } while(position > salary.positions[dept - 1].length);
  print('EMPLOYEE $fName $lName is Added');
  emp.setStrings(fName, lName,  salary.departments[dept - 1], salary.positions[dept - 1].keys.elementAt(position - 1), address,  gender, birthday, email, contactNum, status, lvlOfAccess);
  employee.add(emp);
}

void interfaceDeleteEmployee(){
  interfaceViewEmployee();
  if(employee.isNotEmpty) {
    print('Enter Employee Name you want to delete: ');
    String name = stdin.readLineSync()!;
    int found = 0;
    for (int i = 0; i < employee.length; i++) {
      if (employee[i].status == 'ACTIVE') {
        if (name == employee[i].firstName || name == employee[i].lastName) {
          print('-----------------------------------------');
          print('NAME: ${employee[i].firstName} ${employee[i].lastName}');
          print('LEVEL OF ACCESS: ${employee[i].levelOfAccess}');
          print('DEPARTMENT: ${employee[i].department}');
          print('POSITION: ${employee[i].position}');
          print('EMAIL: ${employee[i].email}');
          print('STATUS: ${employee[i].status}');
          print('-----------------------------------------');
          found += 1;
        }
      }
    }
    print('$found record founded!');
    if (found > 1) {
      print('Enter Employee Email you want to delete: ');
      name = stdin.readLineSync()!;
      for (int i = 0; i < employee.length; i++) {
        if (employee[i].status == 'ACTIVE') {
          if (name == employee[i].email) {
            print('-----------------------------------------');
            print('NAME: ${employee[i].firstName} ${employee[i].lastName}');
            print('LEVEL OF ACCESS: ${employee[i].levelOfAccess}');
            print('DEPARTMENT: ${employee[i].department}');
            print('POSITION: ${employee[i].position}');
            print('EMAIL: ${employee[i].email}');
            print('STATUS: ${employee[i].status}');
            print('-----------------------------------------');
            print('Do you want to Continue to Delete this Record? press Enter!');
            stdin.readLineSync();
            employee[i].status = 'INACTIVE';
            print('Selected Employee has been Deleted!'); //change status to INACTIVE
          }
        }
      }
    } else {
      for (int i = 0; i < employee.length; i++) {
        if (name == employee[i].firstName || name == employee[i].lastName) {
          print('Do you want to Continue to Delete this Record? press Enter!');
          stdin.readLineSync();
          employee[i].status = 'INACTIVE';
          print('Selected Employee has been Deleted!'); //change status to INACTIVE
        }
      }
    }
  }
}

void interfaceViewEmployee(){
  if(employee.isNotEmpty) {
    print('------------------------------------------');
    print('|            EMPLOYEE RECORD              |');
    print('------------------------------------------');
    for (int i = 0; i < employee.length; i++) {
      if(employee[i].status == 'ACTIVE') {
        print('STATUS: ${employee[i].status}');
        print('LEVEL OF ACCESS: ${employee[i].levelOfAccess}');
        print('FIRST NAME: ${employee[i].firstName}');
        print('LAST NAME: ${employee[i].lastName}');
        print('DEPARTMENT: ${employee[i].department}');
        print('POSITION: ${employee[i].position}');
        print('EMAIL: ${employee[i].email}');
        print('GENDER: ${employee[i].gender}');
        print('CONTACT NO.: ${employee[i].contactNumber}');
        print('BIRTHDAY: ${employee[i].birthday}');
        print('ADDRESS: ${employee[i].address}');
        print('LEAVE/S: ${employee[i].leave}');
        if(employee[i].requestedLeave > 0){
          print('Pending Request for Leave: ${employee[i].requestedLeave}');
          print('Do you want to Aprroved Request for Leave?[Y]es or [N]o');
          String choice = stdin.readLineSync()!.toUpperCase();
          if (choice == 'Y') {
            emp.approveLeave = true;
            employee[i].leave = employee[i].leave - employee[i].requestedLeave;
            employee[i].requestedLeave = 0;
          } else if (choice == 'N')  {
            emp.approveLeave = false;
            employee[i].requestedLeave = 0;
            emp.declineLeave = true;
          } else {
            print('not in the choices');
          }
        }
        print('-----------------------------------------');
      }
    }
  } else {
    print('No Records Found!');
  }
}

void editEmployee(){
  interfaceViewEmployee();
  if(employee.isNotEmpty) {
    print('Enter Email You want to Edit Information:');
    String name = stdin.readLineSync()!;
    for(int i = 0; i < employee.length; i++){
      if(name == employee[i].email){
        if(employee[i].status == 'ACTIVE') {
          print('Press Enter to Skip Field!');
          print('STATUS: ${employee[i].status}');
          print('LEVEL OF ACCESS: ${employee[i].levelOfAccess}');
          print('FIRST NAME: ${employee[i].firstName}');
          String first = stdin.readLineSync()!;
          employee[i].firstName = (first == '') ? employee[i].firstName : first;
          print('LAST NAME: ${employee[i].lastName}');
          String last = stdin.readLineSync()!;
          employee[i].lastName = (last == '') ? employee[i].lastName : last;
          print('SELECT DEPARTMENT: ${employee[i].department}');
          int index = 1;
          print('-----------------------------------------');
          salary.departments.forEach((dpt){
            print('[$index] ${dpt}');
            index+=1;
          });
          print('[0] Skip');
          print('-----------------------------------------');
          int dept = int.parse(stdin.readLineSync()!);
          employee[i].department = (dept == 0) ? employee[i].department : salary.departments[dept - 1];
          print('POSITION: ${employee[i].position}');
          print('-----------------------------------------');
          index = 1;
          for(int j = 0; j < employee.length; j++) {
            if(employee[j].department == employee[i].department) {
              salary.positions[j].forEach((pos, sal) {
                print('[$index] $pos');
                index += 1;
                dept = j;
              });
            }
          }
          print('[0] Skip');
          print('-----------------------------------------');
          int position = int.parse(stdin.readLineSync()!);
          employee[i].position = (position == 0) ? employee[i].position : salary.positions[dept].keys.elementAt(position - 1);
          print('EMAIL: ${employee[i].email}');
          String email = stdin.readLineSync()!;
          employee[i].email = (email == '') ? employee[i].email : email;
          print('GENDER: ${employee[i].gender}');
          String gender = stdin.readLineSync()!;
          employee[i].gender = (gender == '') ? employee[i].gender : gender;
          print('CONTACT NO.: ${employee[i].contactNumber}');
          String contact = stdin.readLineSync()!;
          employee[i].contactNumber = (contact == '') ? employee[i].contactNumber : contact;
          print('BIRTHDAY: ${employee[i].birthday}');
          String bday = stdin.readLineSync()!;
          employee[i].birthday = (bday == '') ? employee[i].birthday : bday;
          print('ADDRESS: ${employee[i].address}');
          String address = stdin.readLineSync()!;
          employee[i].address = (address == '') ? employee[i].address : address;
          print('-----------------------------------------');
        }
      }
    }
  }
}

void editAdminAccounts(){
  interfaceViewEmployee();
  if(employee.isNotEmpty) {
    print('Enter Email You want to change to Admin:');
    String name = stdin.readLineSync()!;
    for(int i = 0; i < employee.length; i++){
      if(name == employee[i].email){
        print('Do you want to continue changing Level of Access to "ADMIN"?');
        employee[i].levelOfAccess = 'ADMIN';
        print('enter username for this Admin: ');
        String uname = stdin.readLineSync()!;
        for(int j = 0; j < admin.adminAccount.length; j++){
          (admin.adminAccount[j].keys.elementAt(0) == uname) ?
            print('username already existed!') : '';
        }
        print('enter username for this Admin: ');
        String pass = stdin.readLineSync()!;
        admin.adminAccount.add({'username' : uname, 'password' : pass, 'email' : name});
        print('Successfully added to Admin');
      }
    }
  }
}