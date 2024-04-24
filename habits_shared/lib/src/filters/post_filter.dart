import 'package:common_types/common_types.dart';
import 'package:data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_filter.freezed.dart';
part 'post_filter.g.dart';

class Post {
  Post(this.id, this.body, this.createdAt);
  final int id;
  final String body;
  final DateTime createdAt;
}

@Freezed()
class PostFilter extends Filter<Post> with _$PostFilter {
  const PostFilter._();
  const factory PostFilter.and(List<PostFilter> children) = AndPostFilter;
  const factory PostFilter.or(List<PostFilter> children) = OrPostFilter;
  const factory PostFilter.createdAfter(DateTime value) =
      PostFilterCreatedAfter;
  const factory PostFilter.createdBefore(DateTime value) =
      PostFilterCreatedBefore;
  const factory PostFilter.bodyContains(String value) = PostFilterBodyContains;

  factory PostFilter.fromJson(Json json) => _$PostFilterFromJson(json);

  @override
  bool apply(Post obj) => map(
        and: (f) => f.children.every((child) => child.apply(obj)),
        or: (f) => f.children.any((child) => child.apply(obj)),
        createdAfter: (f) => obj.createdAt.difference(f.value) > Duration.zero,
        createdBefore: (f) => obj.createdAt.difference(f.value) < Duration.zero,
        bodyContains: (f) => obj.body.contains(f.value),
      );
}
