/// Helpers for Strings.
extension XString on String {
  /// Uppercases the first letter of the token.
  String capitalize() {
    if (isEmpty) return '';
    return '${substring(0, 1).toUpperCase()}${substring(1)}';
  }
}
