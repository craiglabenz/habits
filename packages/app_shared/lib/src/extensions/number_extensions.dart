/// Rounding helpers for [double].
extension RoundableDouble on double {
  /// Rounds a [double] to a fixed precision.
  double roundTo(int decimalPlaces) =>
      double.parse(toStringAsFixed(decimalPlaces));
}
