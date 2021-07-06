extension ListExtensions<T> on List<T> {
  // elements checking by index
  bool elementContainsAtIndex(int listIndex) => this.asMap()[listIndex] != null;

  // elements checking by value
  bool elementContainsAtValue(dynamic value) => this.contains(value);

  // get index of list by value
  int elementIndexAtValue(dynamic value) => this.indexOf(value);
}
