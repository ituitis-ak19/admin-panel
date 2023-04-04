// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:admin_ui/screen/model/site.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class EmployeeDetail extends BaseModel<EmployeeDetail> {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? birthDate;
  String? startDate;
  int? departmentId;
  bool? isManager;
  int? remainingTimeOffDays;
  String? gender;
  List<Site>? accessList;

  EmployeeDetail({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.birthDate,
    this.startDate,
    this.departmentId,
    this.isManager,
    this.remainingTimeOffDays,
    this.gender,
    this.accessList
  });
 
  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'birthDate': birthDate,
      'startDate': startDate,
      'department': departmentId,
      'isManager': isManager,
      'remainingTimeOffDays': remainingTimeOffDays,
      'gender': gender,
      'accessList': accessList!.map((x) => x.toJson()).toList(),
    };
  }

  @override
  EmployeeDetail fromJson(Map<String, dynamic> map) {
    return EmployeeDetail(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      birthDate: map['birthDate'] != null ? map['birthDate'] as String : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      departmentId: map['department'] != null ? map['department'] as int : null,
      isManager: map['isManager'] != null ? map['isManager'] as bool : null,
      remainingTimeOffDays: map['remainingTimeOffDays'] != null ? map['remainingTimeOffDays'] as int : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      accessList: map['accessList'] != null
          ? List<Site>.from(map['accessList']
              .map((json) => Site().fromJson(json))
              .toList())
          : null,
    );
  }
}
