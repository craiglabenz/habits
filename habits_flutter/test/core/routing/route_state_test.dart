import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_flutter/core/routing/routing.dart';

void main() {
  group('RouteState should', () {
    test('process initial routes', () {
      final state = RouteState.fromRoute(
        GoRoute(
          path: '/abc',
          builder: (context, state) => Container(),
        ),
      );
      expect(state.uri, Uri(path: '/abc'));
    });

    test('process routes with parameters', () {
      final state = RouteState.fromRoute(
        GoRoute(
          path: '/abc/:id',
          builder: (context, state) => Container(),
        ),
        pathParameters: {'id': '5'},
      );
      expect(state.uri, Uri(path: '/abc/5'));
    });
  });
}
