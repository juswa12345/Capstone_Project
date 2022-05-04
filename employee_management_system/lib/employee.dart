import 'dart:io';
import 'package:employee_management_system/admin.dart';
import 'package:employee_management_system/person.dart';
import 'package:employee_management_system/account.dart';
import 'package:employee_management_system/salary.dart';
import 'package:xml/xml.dart';
import 'package:employee_management_system/interface.dart';

class Employee extends Person{

  bool approveLeave = false;
  bool declineLeave = false;

}

final emp = Employee();

void viewEmployee(String? email){
  if(employee.isNotEmpty) {
    print('------------------------------------------');
    print('|          EMPLOYEE INFORMATION           |');
    print('------------------------------------------');
    for (int i = 0; i < employee.length; i++) {
      if(employee[i].email == email) {
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
        if(emp.approveLeave == false) {
            print('LEAVE/S: ${employee[i].leave}');
            print('LEAVE/S REQUEST: [${employee[i].requestedLeave}] ${(employee[i].requestedLeave > 0)? 'PENDING' : (employee[i].requestedLeave == 0 && emp.declineLeave == true)?'DECLINED' : ''}');
        } else if (emp.approveLeave == true && employee[i].requestedLeave == 0){
          print('LEAVE/S: ${employee[i].leave}');
          print('LEAVE/S REQUEST: APPROVED');
          emp.approveLeave = false;
        }
        print('-----------------------------------------');
      }
    }
  } else {
    print('No Records Found!');
  }
}

void editEmployeeInformation(String? email){
  if(employee.isNotEmpty) {
    for(int i = 0; i < employee.length; i++){
      if(email == employee[i].email){
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

void requestLeave(String? email){
  if(employee.isNotEmpty) {
    print('------------------------------------------');
    print('|          EMPLOYEE INFORMATION           |');
    print('------------------------------------------');
    for (int i = 0; i < employee.length; i++) {
      if(employee[i].email == email) {
        print('STATUS: ${employee[i].status}');
        print('LEVEL OF ACCESS: ${employee[i].levelOfAccess}');
        print('FIRST NAME: ${employee[i].firstName}');
        print('LAST NAME: ${employee[i].lastName}');
        print('LEAVE/S: ${employee[i].leave}');
        print('-----------------------------------------');
        print('Enter number of Leave to Request: (Remaining Leave [${employee[i].leave}]): [max : 3]');
        double? leaveRequest = double.parse(stdin.readLineSync()!);
        if (leaveRequest <= 3) {
          employee[i].requestedLeave = leaveRequest;
          print('Specify Reason: ');
          String request = stdin.readLineSync()!;
          print('Request under Pending for Admin Aprroval');
        }else {
          print('Cannot Exceed the Max allowed Leave');
        }
      }
    }
  } else {
    print('No Records Found!');
  }
}