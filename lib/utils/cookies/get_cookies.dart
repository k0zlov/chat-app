Map<String, String> getCookiesFromRaw(String rawCookies) {
  final Map<String, String> cookies = {};

  final List<String> cookiesList = rawCookies.split(';');

  for (final String cookie in cookiesList) {
    final cookieParts = cookie.split('=');
    if (cookieParts.length >= 2) {
      final String key = cookieParts[0].trim();
      final String value = cookieParts[1].trim();
      cookies[key] = value;
    }
  }

  return cookies;
}
