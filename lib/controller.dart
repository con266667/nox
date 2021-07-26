class Controller {
  List<Function> listeners = [];

  add(Function update) {
    listeners.add(update);
  }

  notify() => listeners.forEach((e) => e());
}