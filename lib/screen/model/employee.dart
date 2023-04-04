// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';




class Employee extends BaseModel<Employee> {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? department;

  Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.department});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    department = json['department'];
    NetworkManager networkManager = NetworkManager();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['department'] = department;
    return data;
  }

  @override
  Employee fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        department: json['department']);
  }

  @override
  String toString() {
    return 'Employee(id: $id, firstName: $firstName, lastName: $lastName, email: $email, department: $department)';
  }
}