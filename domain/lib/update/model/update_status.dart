enum UpdateStatus {
  forceUpdate,
  updateAvailable,
  none;

  bool get isForceUpdate => this == UpdateStatus.forceUpdate;
}
