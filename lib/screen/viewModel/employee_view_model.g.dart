// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeViewModel on _EmployeeViewModelBase, Store {
  late final _$dataStateAtom =
      Atom(name: '_EmployeeViewModelBase.dataState', context: context);

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

  late final _$employeeListAtom =
      Atom(name: '_EmployeeViewModelBase.employeeList', context: context);

  @override
  List<Employee>? get employeeList {
    _$employeeListAtom.reportRead();
    return super.employeeList;
  }

  @override
  set employeeList(List<Employee>? value) {
    _$employeeListAtom.reportWrite(value, super.employeeList, () {
      super.employeeList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_EmployeeViewModelBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
dataState: ${dataState},
employeeList: ${employeeList}
    ''';
  }
}
