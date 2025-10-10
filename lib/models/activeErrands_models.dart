class ActiveErrands {
  String errand;
  String type;
  String rate;
  String imagePath;

  ActiveErrands({
    required this.errand,
    required this.type,
    required this.rate,
    required this.imagePath,
  });

  // 🔄 Shared static list (acts like a global in-memory store)
  static final List<ActiveErrands> _activeErrands = [
    ActiveErrands(
      errand: 'Repair Laptop',
      type: 'Tech Help',
      rate: '100',
      imagePath: 'assets/icons/techhelp2.png',
    ),
    ActiveErrands(
      errand: 'Buy Shampoo',
      type: 'Shopping',
      rate: '80',
      imagePath: 'assets/icons/grusire.png',
    ),
  ];

  // ✅ Returns shared list
  static List<ActiveErrands> getActive() => _activeErrands;

  // ✅ Adds a new errand to shared list
  static void addErrand(ActiveErrands errand) {
    _activeErrands.add(errand);
  }
}
