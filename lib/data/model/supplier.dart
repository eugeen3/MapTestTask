class SupplierModel {
  SupplierModel({
    required this.id,
    required this.name,
  });

  factory SupplierModel.fromJson(dynamic response) {
    return SupplierModel(
      id: response['id'],
      name: response['name'],
    );
  }

  String id;
  String name;

  @override
  String toString() => 'Supplier(id: $id, name: $name)';

  @override
  bool operator ==(covariant SupplierModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
