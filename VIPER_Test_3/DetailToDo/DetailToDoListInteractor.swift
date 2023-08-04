//
//  DetailToDoListInteractor.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 03.08.2023.
//

import Foundation

class DetailToDoListInteractor: DetailToDoListInteractorInputProtocol {
    var presenter: DetailToDoListInteractorOutputProtocol?
    private var item: ToDoItem?

    func getItem() {
        guard let item else { return }
        presenter?.didGetItem(item)
    }

    func setItem(_ item: ToDoItem) {
        self.item = item
    }
    
}

