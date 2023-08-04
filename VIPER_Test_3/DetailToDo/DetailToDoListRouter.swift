//
//  DetailToDoListRouter.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 03.08.2023.
//

import Foundation
import UIKit

final class DetailToDoListRouter: DetailToDoListRouterProtocol {
    static func make(with item: ToDoItem) -> UIViewController {
        let todoListViewController = DetailToDoListViewController()
        var presenter: DetailToDoListPresenterProtocol & DetailToDoListInteractorOutputProtocol = DetailToDoListPresenter()
        var interactor: DetailToDoListInteractorInputProtocol = DetailToDoListInteractor()
        let router = DetailToDoListRouter()

        todoListViewController.presenter = presenter

        presenter.view = todoListViewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.setItem(item)
        interactor.presenter = presenter

        return todoListViewController
    }

    func hideDetailToDoItem(from view: DetailToDoListViewProtocol) {
        guard let viewVC = view as? UIViewController else  {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
}
