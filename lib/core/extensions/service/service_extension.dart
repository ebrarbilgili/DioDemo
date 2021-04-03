enum ServiceURLPath { BASEURL, LOCALURL }

extension ServiceExtension on ServiceURLPath {
  String get value {
    switch (this) {
      case ServiceURLPath.BASEURL:
        return 'https://jsonplaceholder.typicode.com';
      case ServiceURLPath.LOCALURL:
        return 'http://localhost:3000';
      default:
        throw Exception();
    }
  }
}
