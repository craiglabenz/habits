import 'package:serverpod/serverpod.dart';

/// Base class for all query builders.
abstract class BaseQuery {
  /// Base class for all query builders.
  BaseQuery(this.session);

  /// Serverpod [Session] object associated with this request.
  final Session session;
}
