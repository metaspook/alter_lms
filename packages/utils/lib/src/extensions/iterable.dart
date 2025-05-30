/// Iterable Extensions
extension IterableExt<T> on Iterable<T> {
  Iterable<T> get unique => [...toSet()];

  R sum<R extends num>(R Function(T item) selector) {
    num total = 0;
    for (final item in this) {
      total += selector(item);
    }
    return switch (R) {
          int => total.toInt(),
          double => total.toDouble(),
          _ => throw TypeError(),
        }
        as R;
  }
}

extension ListExt<E> on List<E> {
  List<E> get unique => [...toSet()];

  List<E> search(
    String text, {
    required Set<String?> Function(E item) selector,
  }) => [
    for (final item in this)
      if (selector(item).join().toLowerCase().contains(text)) item,
  ];
}
