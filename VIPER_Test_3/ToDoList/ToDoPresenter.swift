//
//  ToDoPresenter.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 02.08.2023.
//

import Foundation

final class ToDoPresenter: ToDoListPresenterProtocol {
    var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorInputProtocol?
    var router: ToDoListRouterProtocol?

    func viewDidAppear() {
        interactor?.getItems()
    }

    func showDetailToDoItem(_ item: ToDoItem) {
        guard let view else { return }
        router?.presentDetailToDoItem(from: view, for: item)
    }

    func addItem(_ item: ToDoItem) {
        interactor?.addItem(item)
    }

    func removeItem(_ item: ToDoItem) {
        interactor?.removeItem(item)
    }

    func updateItem(_ item: ToDoItem) {
        interactor?.updateItem(item)
    }
}

extension ToDoPresenter: ToDoListInteractorOutputProtocol {
    func didAddTodo(_ item: ToDoItem) {
        interactor?.getItems()
    }

    func didRemoveTodo(_ item: ToDoItem) {
        interactor?.getItems()
    }

    func didUpdate(_ item: ToDoItem) {
        interactor?.getItems()
    }

    func didGetTodos(_ items: [ToDoItem]) {
        view?.update(with: items)
    }

    func onError(message: String) {
        view?.update(with: message)
    }
}
