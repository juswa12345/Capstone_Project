import 'package:employee_management_system/person.dart';

class Account{
  String? username;
  String? password;
  String? fullName;
  String? email;

  @override
  createAccount(String uName, String pass, String fullname, String email){
    this.username = uName;
    this.password = pass;
    this.fullName = fullname;
    this.email = email;
  }

  @override
  String toString() {
    return 'Account{username: $username,'
        ' password: $password, '
        'fullName: $fullName,'
        'email: $email}';
  }
}