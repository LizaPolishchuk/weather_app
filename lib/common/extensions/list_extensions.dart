extension ListExtension<E> on List<E> {
  void replaceItem(int index, E item) {
    removeAt(index);
    insert(index, item);
  }
}
