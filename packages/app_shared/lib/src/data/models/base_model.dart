import 'package:app_shared/app_shared.dart';

/// Base type for all data classes. Contains an optional `String` [id],
/// a [toJson] serializer, and thin serializer, [serializeId], which is used for
/// relations. The deserializer, `fromJson`, is provided elsewhere, due to the
/// limitations of factory constructors on abstract classes.
abstract class Model<K> {
  /// Generative constructor.
  const Model();

  /// Database primary key for this data class. A non-null value means this
  /// object has been saved to the database on the server.
  K? get id;

  /// Json serializer, likely provided by `freezed` via `json_serializable`.
  Json toJson();

  /// Default thin serializer for relationships.
  Json serializeId() => {'id': id};
}

/// Flavor of [Model] with String ids.
abstract class StringModel extends Model<String> {
  /// Generative constructor.
  const StringModel();
}

/// Flavor of [Model] with [int] ids.
abstract class IntModel extends Model<int> {
  /// Generative constructor.
  const IntModel();
}

/// Base data class for types which have a `createdAt` field to track age.
abstract class CreatedAtModel<K> extends Model<K> {
  /// Generative constructor.
  const CreatedAtModel();

  /// UTC value when this record was created. This value should be set by the
  /// database. A non-null value here means this record has been saved to the
  /// database.
  DateTime get createdAt;
}
