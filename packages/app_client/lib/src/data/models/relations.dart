// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

/// {@template RelatedModel}
/// Connection for a model to a single related object.
/// {@endtemplate}
class RelatedModel<T, K> extends Equatable {
  /// {@macro RelatedModel}
  RelatedModel({required this.id});

  /// Primary key of the related object. If the value is null, the
  /// relationship is empty.
  final K? id;

  /// Logger.
  AppLogger get logger => AppLogger(toString());

  /// Repository which can load the related object.
  Repository<T, K> get repository => GetIt.I<Repository<T, K>>();

  /// The related object in question, loaded from the [Repository].
  Future<T?> get obj async {
    final idCopy = id;
    if (idCopy == null) return null;
    final result = await repository.getById(idCopy, RequestDetails());
    if (result.isRight()) {
      return result.getOrRaise().item;
    }
    logger.warning('Failed to load $id');
    return null;
  }

  @override
  String toString() => 'RelatedModel<$T, $K>(id: $id)';

  @override
  List<Object?> get props => [id, T.runtimeType, K.runtimeType];
}

/// {@template RelatedModelList}
/// Connection for a model to a list of related objects.
/// {@endtemplate}
class RelatedModelList<T, K> extends Equatable {
  /// {@macro RelatedModelList}
  RelatedModelList({required this.ids});

  /// Primary keys of the related object.
  final Set<K> ids;

  /// Logger.
  AppLogger get logger => AppLogger(toString());

  /// Repository which can load the related object.
  Repository<T, K> get repository => GetIt.I<Repository<T, K>>();

  /// Registered meta-data and glue code for [T].
  Bindings<T, K> get bindings => GetIt.I<Bindings<T, K>>();

  /// The related objects in question, loaded from the [Repository].
  Future<List<T>> get objs async {
    if (ids.isEmpty) return <T>[];
    final localBindings = bindings;
    final result = await repository.getByIds(ids, RequestDetails());
    if (result.isRight()) {
      final success = result.getOrRaise();
      final retrievedIds = success.items
          .map<K?>(localBindings.getId)
          .where((K? id) => id != null)
          .toSet();
      final missedIds = retrievedIds.difference(ids);
      if (missedIds.isNotEmpty) {
        logger.warning('Failed to load $missedIds');
      }
      return success.items;
    }
    logger.warning('Failed to load any Ids from $ids');
    return <T>[];
  }

  @override
  String toString() => 'RelatedModelList<$T, $K>(ids: $ids)';

  @override
  List<Object?> get props => [...ids, T.runtimeType, K.runtimeType];
}
