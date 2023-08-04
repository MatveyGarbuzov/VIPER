//
//  DetailToDoListView.swift
//  VIPER_Test_3
//
//  Created by Matvey Garbuzov on 03.08.2023.
//

import Foundation
import UIKit
import SnapKit

final class DetailToDoListViewController: UIViewController {

    // MARK: Dependencies
    var presenter: DetailToDoListPresenterProtocol?

    // MARK: Properties
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5

        return stack
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .label
        label.numberOfLines = 0

        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0

        return label
    }()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        setupView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: Private methods
    private func setupView() {
        view.backgroundColor = .systemBackground

        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(stack)

        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(contentLabel)
        stack.addArrangedSubview(UIView())
    }

    private func setupConstraints() {
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        contentLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }

    // MARK: Public methods

}

extension DetailToDoListViewController: DetailToDoListViewProtocol {
    func update(with item: ToDoItem) {
        print("Update!")
        print("item: \(item.title) \(item.content)")
        titleLabel.text = item.title
        contentLabel.text = item.content
    }

    func update(with error: String) {
        print("Error: \(error)")
    }
}
