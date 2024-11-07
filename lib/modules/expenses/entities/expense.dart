class Expense {
  final String _name;
  final double _amount;
  final String _description;

  Expense(
    this._name,
    this._amount,
    this._description
  );

  String get name => _name;
  double get amount => _amount;
  String get description => _description;
}