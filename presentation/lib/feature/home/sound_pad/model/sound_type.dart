enum SoundType {
  meow(0),
  love(1),
  anger(2);

  final int id;

  const SoundType(this.id);

  static SoundType fromId(int id) => SoundType.values.firstWhere((type) => type.id == id, orElse: () => SoundType.meow);
}
