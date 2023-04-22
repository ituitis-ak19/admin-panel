// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_off_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimeOffViewModel on _TimeOffViewModelBase, Store {
  late final _$dataStateAtom =
      Atom(name: '_TimeOffViewModelBase.dataState', context: context);

  @override
  DataState get dataState {
    _$dataStateAtom.reportRead();
    return super.dataState;
  }

  @override
  set dataState(DataState value) {
    _$dataStateAtom.reportWrite(value, super.dataState, () {
      super.dataState = value;
    });
  }

  late final _$timeOffListAtom =
      Atom(name: '_TimeOffViewModelBase.timeOffList', context: context);

  @override
  List<TimeOff>? get timeOffList {
    _$timeOffListAtom.reportRead();
    return super.timeOffList;
  }

  @override
  set timeOffList(List<TimeOff>? value) {
    _$timeOffListAtom.reportWrite(value, super.timeOffList, () {
      super.timeOffList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_TimeOffViewModelBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$signTimeOffAsyncAction =
      AsyncAction('_TimeOffViewModelBase.signTimeOff', context: context);

  @override
  Future<bool> signTimeOff(int id) {
    return _$signTimeOffAsyncAction.run(() => super.signTimeOff(id));
  }

  @override
  String toString() {
    return '''
dataState: ${dataState},
timeOffList: ${timeOffList}
    ''';
  }
}
