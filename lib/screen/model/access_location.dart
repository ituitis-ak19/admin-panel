// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class AccessLocation extends BaseModel<AccessLocation> {
  int? id;
  int? type;
  String? siteName;
  
  AccessLocation({
    this.id,
    this.type,
    this.siteName
  });

  
@override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'siteName': siteName,
    };
  }

  @override
   AccessLocation fromJson(Map<String, dynamic> map) {
    return AccessLocation(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
      siteName: map['siteName'] != null ? map['siteName'] as String : null,
    );
  }

}
