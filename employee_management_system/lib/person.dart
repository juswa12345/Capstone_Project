class Person{
  String? firstName;
  String? lastName;
  String? department;
  String? position;
  String? address;
  String? gender;
  String? birthday;
  String? email;
  String? contactNumber;
  String? status;
  String? levelOfAccess;
  double leave = 30;
  double requestedLeave = 0;

  @override
  String toString() {
    return '{firstName: $firstName,'
        ' lastName: $lastName,'
        ' department: $department,'
        ' position: $position,'
        ' address: $address,'
        ' gender: $gender, '
        'birthday: $birthday, '
        'email: $email, '
        'contactNumber: $contactNumber,'
        'status: $status, '
        'levelOfAccess: $levelOfAccess'
        'leave: $leave'
        'requestedLeave: $requestedLeave}';
  }
  @override
  setStrings(
      String fname,
      String lname,
      String dept,
      String position,
      String add,
      String gender,
      String birthday,
      String email,
      String contactNum,
      String status,
      String levelOfAcc,){
    this.firstName = fname;
    this.lastName = lname;
    this.department = dept;
    this.position = position;
    this.address = add;
    this.gender = gender;
    this.birthday = birthday;
    this.email = email;
    this.contactNumber = contactNum;
    this.status = status;
    this.levelOfAccess = levelOfAcc;
  }
}