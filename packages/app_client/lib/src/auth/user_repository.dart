import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';

/// {@template UserRepository}
/// {@endtemplate}
class UserRepository extends Repository<User, int> {
  /// {@macro UserRepository}
  UserRepository()
      : super(
          SourceList<User, int>(
            sources: [
              LocalMemorySource<User, int>(),
              UserServerpodSource(),
            ],
            bindings: const UserBindings(),
          ),
        ) {
    final authRepo = GetIt.I<BaseAuthRepository<AuthUser>>();
    _authSubscription = authRepo.user.listen(
      ((AuthUser, bool) data) {
        // Delete local data whenever the authentication story changes
        for (final source in sourceList.sources) {
          if (source is LocalSource<User, int>) {
            source.clear();
          }
        }
        // If the new user is someone we know about, load their data.
        if (data.$1.isKnown) {
          getById(data.$1.id);
        }
      },
    );
  }

  late StreamSubscription<(AuthUser, bool)> _authSubscription;

  /// Releases all resources.
  void dispose() {
    _authSubscription.cancel();
  }
}

/// {@template UserServerpodSource}
/// {@endtemplate}
class UserServerpodSource extends ServerpodSource<User, int> {
  /// {@macro UserServerpodSource}
  UserServerpodSource() : super(client: GetIt.I<Client>());

  @override
  Future<ReadResult<User>> getById(int id, RequestDetails<User> details) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<ReadListResult<User, int>> getByIds(
    Set<int> ids,
    RequestDetails<User> details,
  ) {
    // TODO: implement getByIds
    throw UnimplementedError();
  }

  @override
  Future<ReadListResult<User, int>> getItems(RequestDetails<User> details) {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  Future<WriteResult<User>> setItem(User item, RequestDetails<User> details) {
    // TODO: implement setItem
    throw UnimplementedError();
  }

  @override
  Future<WriteListResult<User>> setItems(
      List<User> items, RequestDetails<User> details) {
    // TODO: implement setItems
    throw UnimplementedError();
  }
}

/// {@template UserBindings}
/// {@endtemplate}
class UserBindings extends Bindings<User, int> {
  /// {@macro UserBindings}
  const UserBindings();
  @override
  User copy(User obj) => obj.copyWith();

  @override
  User fromJson(Json json) => User.fromJson(json);

  @override
  ApiUrl getDetailUrl(User obj) {
    // TODO: implement getDetailUrl
    throw UnimplementedError();
  }

  @override
  int? getId(User obj) => obj.id;

  @override
  ApiUrl getListUrl() {
    // TODO: implement getListUrl
    throw UnimplementedError();
  }

  @override
  Json toJson(User obj) => obj.toJson();
}
