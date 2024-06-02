import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:habits_server/src/generated/protocol.dart';

// extension SharedUser on shared.User {
//   static shared.User from(User dbUser) => shared.User(
//         uid: dbUser.uid.uuid,
//         name: dbUser.name,
//         country: dbUser.country,
//         timezone: dbUser.timezone,
//       );
// }

extension SharedUser on User {
  shared.User toShared() => shared.User(
        uid: uid.uuid,
        name: name,
        country: country,
        timezone: timezone,
      );
}
