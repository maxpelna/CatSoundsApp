enum AnalyticsEventType {
  playSound('playSound'),
  switchSoundType('switchSoundType'),
  tappedOnSettings('tappedOnSettings'),
  tappedOnTerms('tappedOnTerms'),
  tappedOnPolicy('tappedOnPolicy'),
  tappedOnRateApp('tappedOnRateApp'),
  tappedOnShareApp('tappedOnShareApp'),
  tappedOnAnimatorCredit('tappedOnAnimatorCredit');

  final String name;

  const AnalyticsEventType(this.name);
}
