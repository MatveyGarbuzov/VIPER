//
//  ToDoListProtocols.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 02.08.2023.
//

import Foundation
import UIKit

protocol ToDoListViewProtocol {
    var presenter: ToDoListPresenterProtocol? { get set }

    // From PRESENTER to VIEW
    func update(with items: [ToDoItem])
    func update(with error: String)
}


protocol ToDoListPresenterProtocol {
    var view: ToDoListViewProtocol? { get set }
    var interactor: ToDoListInteractorInputProtocol? { get set }
    var router: ToDoListRouterProtocol? { get set }

    // From VIEW to PRESENTER
    func viewDidAppear()
    func showDetailToDoItem(_ item: ToDoItem)
    func addItem(_ item: ToDoItem)
    func removeItem(_ item: ToDoItem)
    func updateItem(_ item: ToDoItem)
}

protocol ToDoListInteractorInputProtocol {
    var presenter: ToDoListInteractorOutputProtocol? { get set }

    // From PRESENTER to INTERACTOR
    func getItems()
    func addItem(_ item: ToDoItem)
    func removeItem(_ item: ToDoItem)
    func updateItem(_ item: ToDoItem)
}

protocol ToDoListInteractorOutputProtocol {

    // From INTERACTOR to PRESENTER
    func didAddTodo(_ item: ToDoItem)
    func didRemoveTodo(_ item: ToDoItem)
    func didUpdate(_ item: ToDoItem)
    func didGetTodos(_ items: [ToDoItem])
    func onError(message: String)
}

protocol ToDoListRouterProtocol {
    static func make() -> UIViewController

    // From PRESENTER to ROUTER
    func presentDetailToDoItem(from view: ToDoListViewProtocol, for item: ToDoItem)
}
