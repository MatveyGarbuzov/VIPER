//
//  DetailToDoListProtocols.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 03.08.2023.
//

import Foundation
import UIKit

protocol DetailToDoListViewProtocol {
    var presenter: DetailToDoListPresenterProtocol? { get set }

    // From PRESENTER to VIEW
    func update(with item: ToDoItem)
    func update(with error: String)
}

protocol DetailToDoListPresenterProtocol {
    var view: DetailToDoListViewProtocol? { get set }
    var interactor: DetailToDoListInteractorInputProtocol? { get set }
    var router: DetailToDoListRouterProtocol? { get set }

    // From VIEW to PRESENTER
    func viewDidLoad()
    func hideDetailToDoItem()
}

protocol DetailToDoListInteractorInputProtocol {
    var presenter: DetailToDoListInteractorOutputProtocol? { get set }
//    var item: ToDoItem? { get set }
    // From PRESENTER to INTERACTOR
    func getItem()

    // From ROUTER to INTERACT
    func setItem(_ item: ToDoItem)
}

protocol DetailToDoListInteractorOutputProtocol {

    // From INTERACTOR to PRESENTER
    func didGetItem(_ item: ToDoItem)
    func onError(message: String)
}

protocol DetailToDoListRouterProtocol {
    static func make(with: ToDoItem) -> UIViewController

    // From PRESENTER to ROUTER
    func hideDetailToDoItem(from view: DetailToDoListViewProtocol)
}
