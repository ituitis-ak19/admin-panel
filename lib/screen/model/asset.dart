// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class Asset extends BaseModel<Asset> {
  int? id;
  String? name;
  String? description;
  String? dateOfIssue;
  
  Asset({
    this.id,
    this.name,
    this.description,
    this.dateOfIssue,
  });
  
  
  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description' : description,
      'dateOfIssue' : dateOfIssue,
    };
  }

  @override
  Asset fromJson(Map<String, dynamic> map) {
    return Asset(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      dateOfIssue: map['dateOfIssue'] != null ? map['dateOfIssue'] as String : null
    );
  }
}
