//
//  ToDoListView.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 02.08.2023.
//

import Foundation
import UIKit

final class ToDoListViewController: UIViewController {

    // MARK: Dependencies
    var presenter: ToDoListPresenterProtocol?

    // MARK: Properties
    var items: [ToDoItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
        tableView.backgroundColor = .systemBackground

        return tableView
    }()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .red
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }

    // MARK: Private functions
    private func setupView() {
        addSubviews()
        setupConstraints()
        setupNavBar()
        setupTableView()
        addActions()
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.frame = view.frame
        tableView.center = view.center
    }

    private func setupNavBar() {
        title = "ToDoList"

        let addButton: UIBarButtonItem = {
            let button = UIBarButtonItem(
                image: UIImage(systemName: "plus"),
                style: .plain,
                target: self,
                action: #selector(addButtonTapped)
            )
            return button
        }()

        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.tintColor = .label
    }

    private func addActions() {}

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: Public functions


    // MARK: @objc functions
    @objc
    func addButtonTapped() {
        let alertController = UIAlertController(
            title: "Add Todo Item",
            message: "Enter title and content",
            preferredStyle: .alert
        )
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(
            title: "Confirm",
            style: .default,
            handler: { [weak self] (_) in
            let titleText = alertController.textFields![0].text ?? ""
            let contentText = alertController.textFields![1].text ?? ""
            guard !titleText.isEmpty else { return }
            let item = ToDoItem(title: titleText, content: contentText)
            self?.presenter?.addItem(item)
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ToDoListViewController: ToDoListViewProtocol {
    func update(with items: [ToDoItem]) {
        self.items = items
    }

    func update(with error: String) {
        print(error)
    }
}

extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presenter?.showDetailToDoItem(item)

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = items[indexPath.row]
            presenter?.removeItem(item)
        }
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.content
//        cell.backgroundColor = .systemback
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
}
