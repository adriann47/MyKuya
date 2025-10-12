class WalletService {
  static final WalletService _instance = WalletService._internal();

  factory WalletService() {
    return _instance;
  }

  WalletService._internal();

  int _balance = 0;
  final List<Map<String, dynamic>> _transactions = [];

  int get balance => _balance;
  List<Map<String, dynamic>> get transactions => _transactions;

  void addBalance(int amount, {String type = 'Earned'}) {
    _balance += amount;
    _transactions.insert(0, {
      'type': type,
      'amount': amount,
    });
  }

  void deductBalance(int amount, {String type = 'Hire'}) {
    if (amount <= _balance) {
      _balance -= amount;
      _transactions.insert(0, {
        'type': type,
        'amount': amount,
      });
    }
  }

}
