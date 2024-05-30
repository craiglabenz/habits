/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class NotFoundException
    implements _i1.SerializableException, _i1.SerializableModel {
  NotFoundException._({
    required this.field,
    required this.value,
    required this.model,
  });

  factory NotFoundException({
    required String field,
    required String value,
    required _i2.Model model,
  }) = _NotFoundExceptionImpl;

  factory NotFoundException.fromJson(Map<String, dynamic> jsonSerialization) {
    return NotFoundException(
      field: jsonSerialization['field'] as String,
      value: jsonSerialization['value'] as String,
      model: _i2.Model.fromJson((jsonSerialization['model'] as int)),
    );
  }

  String field;

  String value;

  _i2.Model model;

  NotFoundException copyWith({
    String? field,
    String? value,
    _i2.Model? model,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'field': field,
      'value': value,
      'model': model.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NotFoundExceptionImpl extends NotFoundException {
  _NotFoundExceptionImpl({
    required String field,
    required String value,
    required _i2.Model model,
  }) : super._(
          field: field,
          value: value,
          model: model,
        );

  @override
  NotFoundException copyWith({
    String? field,
    String? value,
    _i2.Model? model,
  }) {
    return NotFoundException(
      field: field ?? this.field,
      value: value ?? this.value,
      model: model ?? this.model,
    );
  }
}
