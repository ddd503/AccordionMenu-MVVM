//
//  ViewController.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.inputs.viewDidLoad()
    }

    private func bindViewModel() {
        viewModel.outputs.setup = { [weak self] in
            self?.tableView.dataSource = self
        }
        viewModel.outputs.updateTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.outputs.beginChangeTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.beginUpdates()
            }
        }
        viewModel.outputs.endChangeTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.endUpdates()
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.largeAreaCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else {
            fatalError()
        }
        guard !viewModel.outputs.largeArea.isEmpty else {
            // display error screen
            return cell
        }
        cell.setupMenuCell(largeAreaData: viewModel.outputs.largeArea[indexPath.row])
        return cell
    }
}
