import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_shared/habits_shared.dart' as shared;

/// Adds converters between the [User] database model and its public
/// counterpart, [shared.User].
extension SharedUser on User {
  /// Converts a database model object into its public counterpart.
  shared.User toShared() => shared.User(
        uid: uid.uuid,
        name: name,
        country: country,
        timezone: timezone,
      );
}
