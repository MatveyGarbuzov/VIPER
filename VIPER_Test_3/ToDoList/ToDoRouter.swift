//
//  ToDoRouter.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 02.08.2023.
//

import UIKit

class TodoListRouter: ToDoListRouterProtocol {

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    static func make() -> UIViewController {
        let todoListViewController = ToDoListViewController()
        var presenter: ToDoListPresenterProtocol & ToDoListInteractorOutputProtocol = ToDoPresenter()
        var interactor: ToDoListInteractorInputProtocol = ToDoInteractor()
        let router = TodoListRouter()

        todoListViewController.presenter = presenter

        presenter.view = todoListViewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        return todoListViewController
    }

    func presentDetailToDoItem(from view: ToDoListViewProtocol, for item: ToDoItem) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }

        let todoDetailVC = DetailToDoListRouter.make(with: item)
        viewVC.navigationController?.pushViewController(todoDetailVC, animated: true)
    }
}
