//
//  DetailToDoListPresenter.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 03.08.2023.
//

import Foundation

final class DetailToDoListPresenter: DetailToDoListPresenterProtocol {
    var view: DetailToDoListViewProtocol?
    var interactor: DetailToDoListInteractorInputProtocol?
    var router: DetailToDoListRouterProtocol?

    func viewDidLoad() {
        interactor?.getItem()
    }

    func hideDetailToDoItem() {
        guard let view else { return }
        router?.hideDetailToDoItem(from: view)
    }
}

extension DetailToDoListPresenter: DetailToDoListInteractorOutputProtocol {
    func didGetItem(_ item: ToDoItem) {
        view?.update(with: item)
    }

    func onError(message: String) {
        view?.update(with: message)
    }


}
