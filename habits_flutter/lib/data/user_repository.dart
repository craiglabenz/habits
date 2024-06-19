import 'dart:async';
import 'dart:collection';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:habits_shared/habits_shared.dart';

/// {@template BaseSessionUserRepository}
/// {@endtemplate}
abstract class BaseSessionUserRepository with ReadinessMixin {
  /// Synchronously available [User] object pre-loaded whenever the [AuthUser]
  /// changes. Safely accessing this depends on [isReady] being true.
  User get loadedUser;

  /// Persists new data about the existing [User] object attached to the active
  /// session.
  Future<WriteResult<User>> save(User user);
}

/// {@template SessionUserRepository}
/// {@endtemplate}
class SessionUserRepository
    with ReadinessMixin
    implements BaseSessionUserRepository {
  /// {@macro SessionUserRepository}
  SessionUserRepository() : client = GetIt.I<Client>() {
    initReadyCheck();
    final authRepo = GetIt.I<BaseAuthRepository<AuthUser>>();
    _authSubscription = authRepo.user.listen(
      ((AuthUser, bool) data) => updateForNewUser(data.$1),
    );
    updateForNewUser(authRepo.lastUser.$1);
  }

  @override
  void initReadyCheck() {
    _loadedUser = null;
    super.initReadyCheck();
  }

  /// Logger.
  final AppLogger logger = AppLogger('SessionUserRepository');

  /// Serverpod [Client].
  late Client client;

  User? _loadedUser;

  @override
  User get loadedUser {
    if (!isNotReady) {
      logger.severe(
        'Accessed SessionUserRepository.loadedUser while unready. '
        'Be sure to `await userRepository.ready` before accessing '
        '`userRepository.loadedUser`.',
      );
      throw Exception(
        'Accessed SessionUserRepository.loadedUser while unready',
      );
    }
    return _loadedUser!;
  }

  late StreamSubscription<(AuthUser, bool)> _authSubscription;

  /// Resyncs this repository's [LocalMemorySource] data every time the active
  /// user changes.
  Future<void> updateForNewUser(AuthUser user) async {
    logger.finest('Updating loadedUser for $user');
    if (isResolved) {
      // Delete local data whenever the authentication story changes
      initReadyCheck();
    }

    // If the new user is someone we know about, load their data.
    if (user.isKnown) {
      try {
        _loadedUser = await client.user.getForSession();
        logger.finest('Set loadedUser to $_loadedUser');
        markReady();
      } on NotFoundException catch (e) {
        logger.severe('Error loading User for session: $e');
        markReadinessFailed();
      }
    }
  }

  @override
  Future<WriteResult<User>> save(User user) async {
    try {
      _loadedUser = await client.user.update(user);
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

/// Fake implementation of [SessionUserRepository] suitable for tests.
class FakeSessionUserRepository
    with ReadinessMixin
    implements BaseSessionUserRepository {
  /// Builds a [FakeSessionUserRepository] which represents the fully loaded
  /// state.
  FakeSessionUserRepository.ready(
    this.loadedUser, {
    List<WriteResult<User>> saveResults = const [],
  })  : isReady = true,
        _saveResults = Queue.from(saveResults) {
    _initializedCompleter.complete(true);
  }

  /// Builds a [FakeSessionUserRepository] which represents the unloaded state.
  FakeSessionUserRepository.unReady()
      : isReady = false,
        _saveResults = Queue.from(const []);

  @override
  late User loadedUser;

  final _initializedCompleter = Completer<bool>();

  @override
  Future<bool> get ready => _initializedCompleter.future;

  @override
  bool isReady;

  /// Hardcoded results to [save].
  final Queue<WriteResult<User>> _saveResults;

  @override
  Future<WriteResult<User>> save(User user) => Future.value(_saveResults.first);
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
