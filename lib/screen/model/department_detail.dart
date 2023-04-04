// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class DepartmentDetail extends BaseModel<DepartmentDetail> {
  int? id;
  String? name;
  int? managerId;
  
  DepartmentDetail({
    this.id,
    this.name,
    this.managerId,
  });
  
  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'managerId': managerId,
    };
  }

  @override
  DepartmentDetail fromJson(Map<String, dynamic> map) {
    return DepartmentDetail(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      managerId: map['managerId'] != null ? map['managerId'] as int : null,
    );
  }
}
