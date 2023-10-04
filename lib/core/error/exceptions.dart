class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class NotConnectedException implements Exception {}

class UnauthorizedException implements Exception {}

class CacheException implements Exception {}

class ItemNotFoundException implements Exception {}
