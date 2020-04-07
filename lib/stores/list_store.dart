import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = "";
  @action
  setNewTodoTitle(String value) => newTodoTitle = value;

  @observable
  ObservableList<String> todoList = ObservableList<String>();

  @action
  void addTodo() {
    todoList.add(newTodoTitle);
  }
}
