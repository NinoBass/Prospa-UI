enum ButtonType {
  primary,
  ghost;

  const ButtonType();
}

extension ButtonTypeX on ButtonType {
  bool get isPrimary => this == ButtonType.primary;
  bool get isGhost => this == ButtonType.ghost; 
}
