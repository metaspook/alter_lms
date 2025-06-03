import 'package:equatable/equatable.dart';

final class Menu extends Equatable {
  const Menu({
    required this.id,
    required this.key,
    this.imageName,
    this.routeName,
    this.isRoot = true,
    this.children = const [],
  });

  factory Menu.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      'id': final String id,
      'key': final String key,
      'imageName': final String? imageName,
      'routeName': final String? routeName,
      'isRoot': final bool isRoot,
      'children': final List<dynamic> children,
    } =>
      Menu(
        id: id,
        key: key,
        imageName: imageName,
        routeName: routeName,
        isRoot: isRoot,
        children: children
            .map((x) => Menu.fromJson(x as Map<String, dynamic>))
            .toList(),
      ),
    _ => throw FormatException('Invalid json: $json'),
  };

  final String id;
  final String key;
  final String? imageName;
  final String? routeName;
  final bool isRoot;
  final List<Menu> children;
  bool get isParent => children.isNotEmpty;

  Menu copyWith({
    String? id,
    String? label,
    String? imageName,
    String? routeName,
    bool? isRoot,
    List<Menu>? children,
  }) {
    return Menu(
      id: id ?? this.id,
      key: label ?? key,
      imageName: imageName ?? this.imageName,
      routeName: routeName ?? this.routeName,
      isRoot: isRoot ?? this.isRoot,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': key,
      'imageName': imageName,
      'routeName': routeName,
      'isRoot': isRoot,
      'children': children.map((x) => x.toJson()).toList(),
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, key, imageName, routeName, isRoot, children];
}
