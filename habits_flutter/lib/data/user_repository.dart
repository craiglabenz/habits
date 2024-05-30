import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:habits_shared/habits_shared.dart';

/// {@template SessionUserRepository}
/// {@endtemplate}
class SessionUserRepository extends Repository<User, String> {
  /// {@macro SessionUserRepository}
  SessionUserRepository()
      : client = GetIt.I<Client>(),
        super(SourceList<User, String>.empty(const UserBindings())) {
    final authRepo = GetIt.I<BaseAuthRepository<AuthUser>>();
    _authSubscription = authRepo.user.listen(
      ((AuthUser, bool) data) => updateForNewUser(data.$1),
    );
    updateForNewUser(authRepo.lastUser.$1);
  }

  Completer<bool> _initialized = Completer<bool>();

  /// Ready checker. Resolves once [loadedUser] is ready.
  Future<bool> get ready => _initialized.future;

  /// Logger.
  final AppLogger logger = AppLogger('SessionUserRepository');

  /// Serverpod [Client].
  late Client client;

  /// The ready-to-go [User] object pre-loaded whenever the [AuthUser] changes.
  late User loadedUser;
  late StreamSubscription<(AuthUser, bool)> _authSubscription;

  /// Resyncs this repository's [LocalMemorySource] data every time the active
  /// user changes.
  Future<void> updateForNewUser(AuthUser user) async {
    if (!_initialized.isCompleted) {
      _initialized.complete(false);
      _initialized = Completer<bool>();
    }
    logger.info('Updating loadedUser for $user');
    // Delete local data whenever the authentication story changes
    for (final source in sourceList.sources) {
      if (source is LocalSource<User, String>) {
        source.clear();
      }
    }
    // If the new user is someone we know about, load their data.
    if (user.isKnown) {
      try {
        loadedUser = await client.user.getForSession();
        logger.info('Set loadedUser to $loadedUser');
        _initialized.complete(true);
      } on NotFoundException catch (e) {
        logger.severe('Error loading User for session: $e');
        _initialized.complete(false);
      }
    }
  }

  /// Persists the latest [User] info to the server.
  Future<WriteResult<User>> save(User user) async {
    try {
      loadedUser = await client.user.update(user);
      return Right(WriteSuccess<User>(user, details: RequestDetails()));
    } on NotFoundException catch (e) {
      logger.severe('Error saving User for session: $e');
      return Left(WriteFailure<User>.notFoundException(e));
    }
  }

  /// Releases all resources.
  void dispose() {
    _authSubscription.cancel();
  }
}

/// {@template UserBindings}
/// {@endtemplate}
class UserBindings extends Bindings<User, String> {
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
  String? getId(User obj) => obj.uid;

  @override
  ApiUrl getListUrl() {
    // TODO: implement getListUrl
    throw UnimplementedError();
  }

  @override
  Json toJson(User obj) => obj.toJson();
}
