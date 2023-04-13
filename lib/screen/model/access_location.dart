// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class AccessLocation extends BaseModel<AccessLocation> {
  int? id;
  String? name;
  int? type;
  String? siteName;
  
  AccessLocation({
    this.id,
    this.name,
    this.type,
    this.siteName
  });

  
@override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'siteName': siteName,
    };
  }

  @override
   AccessLocation fromJson(Map<String, dynamic> map) {
    return AccessLocation(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      siteName: map['siteName'] != null ? map['siteName'] as String : null,
    );
  }

}
