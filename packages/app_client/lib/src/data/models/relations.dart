// // ignore_for_file: prefer_const_constructors_in_immutables

// import 'package:equatable/equatable.dart';
// import 'package:data/data.dart';

// /// {@template relatedModel}
// /// Connection for a model to a single related object.
// /// {@endtemplate}
// class RelatedModel<T> extends Equatable {
//   /// {@macro relatedModel}
//   RelatedModel({
//     required this.id,
//     required this.repository,
//   });

//   /// Primary key of the related object. If the value is null, the
//   /// relationship is empty.
//   final String? id;

//   /// Repository which can load the related object.
//   final Repository<T> repository;

//   /// The related object in question, loaded from the [Repository].
//   Future<T?> get obj async {
//     if (id == null) return null;
//     final result = await repository.getById(id!, RequestDetails.read());
//     if (result.isRight()) {
//       return result.getOrRaise().item;
//     }
//     // TODO(craiglabenz): Log this
//     return null;
//   }

//   @override
//   String toString() => 'RelatedModel<$T>(id: $id, repository: $repository)';

//   @override
//   List<Object?> get props =>
//      [id, repository.sourceList.bindings.getListUrl()];
// }

// /// {@template relatedModels}
// /// Connection for a model to a list of related objects.
// /// {@endtemplate}
// class RelatedModelList<T> extends Equatable {
//   /// {@macro relatedModels}
//   RelatedModelList({
//     required this.ids,
//     required this.repository,
//   });

//   /// Primary keys of the related object.
//   final Set<String> ids;

//   /// Repository which can load the related objects.
//   final Repository<T> repository;

//   /// The related objects in question, loaded from the [Repository].
//   Future<List<T>> get objs async {
//     if (ids.isEmpty) return <T>[];
//     final result = await repository.getByIds(ids, RequestDetails.read());
//     if (result.isRight()) {
//       final success = result.getOrRaise();
//       if (success.missingItemIds.isNotEmpty) {
//         // TODO(craiglabenz): Log this
//       }
//       return success.items;
//     }
//     // TODO(craiglabenz): Log this
//     return <T>[];
//   }

//   @override
//   List<Object?> get props => [
//         ...ids,
//         repository.sourceList.bindings.getListUrl(),
//       ];
// }
