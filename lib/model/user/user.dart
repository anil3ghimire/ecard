import 'dart:convert';

import 'address.dart';
import 'company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
    id: data['id'] as int?,
    name: data['name'] as String?,
    username: data['username'] as String?,
    email: data['email'] as String?,
    address: data['address'] == null
        ? null
        : Address.fromMap(data['address'] as Map<String, dynamic>),
    phone: data['phone'] as String?,
    website: data['website'] as String?,
    company: data['company'] == null
        ? null
        : Company.fromMap(data['company'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address?.toMap(),
    'phone': phone,
    'website': website,
    'company': company?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
