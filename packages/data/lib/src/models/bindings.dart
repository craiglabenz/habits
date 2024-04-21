import 'package:common_types/common_types.dart';
import 'package:data/data.dart';

/// {@template Bindings}
/// Holds meta-information to connect an [ApiSource] to the Serverpod endpoints
/// for a given subclass of [Model].
/// {@endtemplate}
abstract class Bindings<T, K> {
  /// {@macro Bindings}
  const Bindings();

  /// Primary Key getters.
  K? getId(T obj);

  /// [Json] deserialization constructor for [T].
  T fromJson(Json json);

  /// [Json] serialization for [T].
  Json toJson(T obj);

  /// Returns the Api's list [ApiUrl] for [T].
  ApiUrl getListUrl();

  /// Returns the Api's detail [ApiUrl] for [T].
  ApiUrl getDetailUrl(T obj);
}
