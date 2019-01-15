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
            self?.tableView.delegate = self
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.outputs.largeAreaCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard !viewModel.outputs.largeArea.isEmpty else {
            // display error screen
            return cell
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableViewHeader.instance()
        let largeAreaName = viewModel.outputs.largeArea.isEmpty ? nil : viewModel.outputs.largeArea[section].areaName
        headerView.setTitle(largeAreaName: largeAreaName)
        return headerView
    }
}
