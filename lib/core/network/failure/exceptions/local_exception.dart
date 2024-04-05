
/// Use [LocalException] to:
/// - Throw an [Exception] in a [DataSource].
///
/// - Catch the [Exception] in a [Repository].
class LocalException implements Exception {
  final String message;

  LocalException({required this.message});
}
