extension ObjectExtensions on Object? {
  T? onlyIf<T extends Object?>(final bool value) {
    if (value) return this as T;
    return null;
  }
}