//
//  ToDoEntity.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 02.08.2023.
//

import Foundation

class ToDoItem {
    var title: String
    var content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

class ToDoItemsDB {
    private init() {}
    public static let shared = ToDoItemsDB()

    public private(set) var items: [ToDoItem] = [
        ToDoItem(title: "Focus", content: "Decide on what you want to focus in your life"),
        ToDoItem(title: "Value", content: "Decide on what values are meaningful in your life"),
        ToDoItem(title: "Action", content: "Decide on what you should do to achieve empowering life")
    ]

    func add(_ item: ToDoItem) {
        items.append(item)
    }

    func removeTodo(_ todo: ToDoItem) {
        if let index = items.firstIndex(where: { $0 === todo }) {
            items.remove(at: index)
        }
    }

    func update(_ item: ToDoItem) {
        // TODO: Добавить обновление задачи
        print("TODO: Добавить обновление задачи")
    }
}
