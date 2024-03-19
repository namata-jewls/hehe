// this class is used to store details about a friend
class SummaryData{
  final String _name;
  final String _nickname;
  final int _age;
  final bool _inRelationship;
  final double _happinessLevel;
  final String _superpower;
  final String _motto;

  SummaryData(this._name, this._nickname, this._age, this._inRelationship, this._happinessLevel, this._superpower, this._motto);

  String get name => _name;
  String get nickname => _nickname;
  int get age => _age;
  bool get inRelationship => _inRelationship;
  double get happinessLevel => _happinessLevel;
  String get superpower => _superpower;
  String get motto => _motto;
}