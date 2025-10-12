class ActiveErrands {
  String errand;
  String type;
  String rate;
  String status;
  String imagePath;

  ActiveErrands({
    required this.errand,
    required this.type,
    required this.rate,
    required this.status,
    required this.imagePath,
  });

  static final List<ActiveErrands> _activeErrands = [
    ActiveErrands(
      errand: 'Repair Laptop',
      type: 'Tech Help',
      rate: '100',
      status: 'Ongoing',
      imagePath: 'assets/icons/techhelp2.png',
    ),
    ActiveErrands(
      errand: 'Buy Shampoo',
      type: 'Shopping',
      rate: '80',
      status: 'Ongoing',
      imagePath: 'assets/icons/grusire.png',
    ),
  ];

  static List<ActiveErrands> getActive() => _activeErrands;

  static void addErrand(ActiveErrands errand) {
    _activeErrands.add(errand);
  }
}
