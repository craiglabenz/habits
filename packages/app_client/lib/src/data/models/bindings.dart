import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';

/// {@template Bindings}
/// Holds meta-information to connect a given data type to its repository and
/// sources.
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

  /// Returns a copy of the supplied item with equivalent  values.
  T copy(T obj);

  /// Returns the Api's list [ApiUrl] for [T].
  ApiUrl getListUrl();

  /// Returns the Api's detail [ApiUrl] for [T].
  ApiUrl getDetailUrl(T obj);
}
