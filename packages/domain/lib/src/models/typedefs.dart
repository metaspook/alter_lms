typedef Json = Map<String, dynamic>;
typedef DelayRecord = ({int none, int normal, int extended});
typedef DirectoryRecord = ({String documents, String applicationSupport});
// extension JsonExt on Json {
//   T get<T>(String key) {
//     final v = this[key];
//     if (T == String) return (v ?? '') as T;
//     if (T == int) return (v ?? 0) as T;
//     if (T == double) return (v ?? 0.0) as T;
//     if (T == bool) return (v ?? false) as T;
//     if (T == List) return (v ?? <dynamic>[]) as T;
//     if (T == Map) return (v ?? <dynamic, dynamic>{}) as T;
//     throw Exception('Unsupported type or null value for key: $key');
//   }
// }

  // id: map['id'] ?? '',
  //     label: map['label'] ?? '',
  //     imageName: map['imageName'] ?? '',
  //     routeName: map['routeName'] ?? '',
  //     isRoot: map['isRoot'] ?? false,
  //     children: List<Menu>.from(map['children']?.map(Menu.fromMap)),