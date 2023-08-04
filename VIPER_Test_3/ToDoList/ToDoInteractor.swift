//
//  ToDoInteractor.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 02.08.2023.
//

import Foundation

final class ToDoInteractor: ToDoListInteractorInputProtocol {
    var presenter: ToDoListInteractorOutputProtocol?
    var toDoItemsDB = ToDoItemsDB.shared
    var toDoItems: [ToDoItem] { toDoItemsDB.items }

    func getItems() {
        presenter?.didGetTodos(toDoItems)
    }

    func addItem(_ item: ToDoItem) {
        toDoItemsDB.add(item)
        presenter?.didAddTodo(item)
    }

    func removeItem(_ item: ToDoItem) {
        toDoItemsDB.removeTodo(item)
        presenter?.didRemoveTodo(item)
    }

    func updateItem(_ item: ToDoItem) {
        toDoItemsDB.update(item)
        presenter?.didUpdate(item)
    }
}
