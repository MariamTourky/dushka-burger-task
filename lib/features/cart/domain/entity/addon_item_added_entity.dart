class AddonItemAddedEntity {
  final int id;
  final String name;
  final String price;

  const AddonItemAddedEntity({
    required this.id,
    required this.name,
    required this.price,
  });
}

extension AddonItemAddedEntityText on List<AddonItemAddedEntity> {
  String toDisplayText() {
    if (isEmpty) return '';

    return map((addon) {
      if (addon.price.isEmpty || addon.price == '0') {
        return addon.name;
      }
      return '${addon.name} (+${addon.price})';
    }).join(', ');
  }
}
