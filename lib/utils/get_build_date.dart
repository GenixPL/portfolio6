// Passed at build time: --dart-define=BUILD_DATE=yyyy-mm-dd hh:mm
// Falls back to the app start time when not set (local runs).
const String _definedBuildDate = String.fromEnvironment('BUILD_DATE');

final String _buildDate = _definedBuildDate.isNotEmpty
    ? _definedBuildDate
    : DateTime.now().toUtc().toIso8601String().substring(0, 16).replaceFirst('T', ' ');

String getBuildDate() => _buildDate;
