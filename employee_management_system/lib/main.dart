import 'dart:io';

import 'package:employee_management_system/interface.dart';

void main(){
  print('PLEASE READ!!!');
  print('EMPLOYEE MANAGEMENT SYSTEM CAPSTONE!\n'
      'admin account: UN: admin123 pass: adminadmin\n'
      'admin account has a capability to add edit remove employee and also '
      'add edit view employee salaries');
  print('---------------------------------');
  print('SuperAdmin account: UN: superadmin pass: superadmin\n'
      'super admin account has the same capability as the admin '
      'but has a higher access to the system which is appointing admin '
      'from the employee record.');
  print('---------------------------------');
  print('TO CONTINUE PRESS ENTER');
  stdin.readLineSync();


  print('--------EMPLOYEE MANAGEMENT SYSTEM----------');
  mainInterface();
}