extension EnumParsing<T extends Enum> on Iterable<T> {
  T? valueFromString(String? valueString) {
    if (valueString == null) return null;

    try {
      return firstWhere(
        (e) =>
            e.toString().split('.').last.toLowerCase() ==
            valueString.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
