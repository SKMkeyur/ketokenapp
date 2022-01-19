import 'package:flutter/material.dart';

class ContactList{

  late String _givenName;
  late String _middleName;
  late String _familyName;
  late String _displayName;
  late List _phones;
  late List _postalAddress;
  late DateTime _birthday;
  late String _company;
  late List _emails;
  late String _suffix;
  late String _prefix;


  ContactList(
      this._givenName,
      this._middleName,
      this._familyName,
      this._displayName,
      this._phones,
      this._postalAddress,
      this._birthday,
      this._company,
      this._emails,
      this._suffix,
      this._prefix);

  String get suffix => _suffix;

  set suffix(String value) {
    _suffix = value;
  }

  String get givenName => _givenName;

  set givenName(String value) {
    _givenName = value;
  }

  String get middleName => _middleName;

  set middleName(String value) {
    _middleName = value;
  }

  List get emails => _emails;

  set emails(List value) {
    _emails = value;
  }

  String get company => _company;

  set company(String value) {
    _company = value;
  }

  DateTime get birthday => _birthday;

  set birthday(DateTime value) {
    _birthday = value;
  }

  List get postalAddress => _postalAddress;

  set postalAddress(List value) {
    _postalAddress = value;
  }

  List get phones => _phones;

  set phones(List value) {
    _phones = value;
  }

  String get displayName => _displayName;

  set displayName(String value) {
    _displayName = value;
  }

  String get familyName => _familyName;

  set familyName(String value) {
    _familyName = value;
  }

  String get prefix => _prefix;

  set prefix(String value) {
    _prefix = value;
  }
}