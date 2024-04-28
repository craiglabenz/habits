/// {@template DisplayableError}
/// Error suitable for showing to the end user.
/// {@endtemplate}
class DisplayableError {
  /// {@macro DisplayableError}
  const DisplayableError(this.message);

  /// String the user will see.
  final String message;
}
