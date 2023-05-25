BuildEnvironment? env;

class BuildEnvironment {
  final String baseUrl;

  const BuildEnvironment._init({
    required this.baseUrl,
  });

  static void init({
    required String baseUrl,
  }) {
    env ??= BuildEnvironment._init(
      baseUrl: baseUrl,
    );
  }
}
