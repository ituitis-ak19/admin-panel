// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeDetailViewModel on _EmployeeDetailViewModelBase, Store {
  late final _$dataStateAtom =
      Atom(name: '_EmployeeDetailViewModelBase.dataState', context: context);

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

  late final _$employeeDetailAtom = Atom(
      name: '_EmployeeDetailViewModelBase.employeeDetail', context: context);

  @override
  EmployeeDetail? get employeeDetail {
    _$employeeDetailAtom.reportRead();
    return super.employeeDetail;
  }

  @override
  set employeeDetail(EmployeeDetail? value) {
    _$employeeDetailAtom.reportWrite(value, super.employeeDetail, () {
      super.employeeDetail = value;
    });
  }

  late final _$departmentListAtom = Atom(
      name: '_EmployeeDetailViewModelBase.departmentList', context: context);

  @override
  List<Department>? get departmentList {
    _$departmentListAtom.reportRead();
    return super.departmentList;
  }

  @override
  set departmentList(List<Department>? value) {
    _$departmentListAtom.reportWrite(value, super.departmentList, () {
      super.departmentList = value;
    });
  }

  late final _$siteListAtom =
      Atom(name: '_EmployeeDetailViewModelBase.siteList', context: context);

  @override
  List<Site>? get siteList {
    _$siteListAtom.reportRead();
    return super.siteList;
  }

  @override
  set siteList(List<Site>? value) {
    _$siteListAtom.reportWrite(value, super.siteList, () {
      super.siteList = value;
    });
  }

  late final _$isManagerObservableAtom = Atom(
      name: '_EmployeeDetailViewModelBase.isManagerObservable',
      context: context);

  @override
  bool? get isManagerObservable {
    _$isManagerObservableAtom.reportRead();
    return super.isManagerObservable;
  }

  @override
  set isManagerObservable(bool? value) {
    _$isManagerObservableAtom.reportWrite(value, super.isManagerObservable, () {
      super.isManagerObservable = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_EmployeeDetailViewModelBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_EmployeeDetailViewModelBaseActionController =
      ActionController(name: '_EmployeeDetailViewModelBase', context: context);

  @override
  dynamic changeIsManager() {
    final _$actionInfo = _$_EmployeeDetailViewModelBaseActionController
        .startAction(name: '_EmployeeDetailViewModelBase.changeIsManager');
    try {
      return super.changeIsManager();
    } finally {
      _$_EmployeeDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataState: ${dataState},
employeeDetail: ${employeeDetail},
departmentList: ${departmentList},
siteList: ${siteList},
isManagerObservable: ${isManagerObservable}
    ''';
  }
}
