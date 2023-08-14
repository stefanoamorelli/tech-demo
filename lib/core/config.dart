/// Represents the configuration for our application.
class Config {
  final Uri apiUri;
  final int displayNumberOfUsers;

  Config({
    required this.apiUri,
    required this.displayNumberOfUsers,
  });

  /// Returns the default configuration for the application.
  ///
  /// In a real-life scenario, this method could be extended to retrieve
  /// the configuration from environment variables (CI/CD) or flavors.
  static Config getDefaultConfig() {
    return Config(
      apiUri: Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
      displayNumberOfUsers: 5,
    );
  }
}
