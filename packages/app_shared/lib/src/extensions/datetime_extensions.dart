extension on DateTime {
  /// Shorter [toIso8601String] getter.
  // ignore: unused_element
  String get iso => toIso8601String();
}

extension on DateTime? {
  /// Easy greater than comparison for DateTimes.
  // ignore: unused_element
  bool operator >(DateTime other) =>
      this != null && this!.difference(other) > Duration.zero;

  /// Easy less than comparison for DateTimes.
  // ignore: unused_element
  bool operator <(DateTime other) =>
      this != null && this!.difference(other) < Duration.zero;

  // ignore: unused_element
  bool operator >=(DateTime other) =>
      this != null && this!.difference(other) >= Duration.zero;
  // ignore: unused_element
  bool operator <=(DateTime other) =>
      this != null && this!.difference(other) <= Duration.zero;
}
