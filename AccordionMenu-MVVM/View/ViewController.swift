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
            guard let self = self else { return }
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.tableFooterView = UIView()
        }
        viewModel.outputs.updateTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.outputs.updateTableViewSection = { [weak self] (section) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.beginUpdates()
                self.tableView.reloadSections([section], with: .fade)
                self.tableView.endUpdates()
            }
        }
    }

    private func bindHeaderView(headerView: TableViewHeader) {
        headerView.outputs.didTapHeaderView = { [weak self] (section) in
            DispatchQueue.main.async {
                self?.viewModel.inputs.didTapHeader(section: section)
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.outputs.largeAreaCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let largeAreaData = viewModel.outputs.largeArea.isEmpty ? nil : viewModel.outputs.largeArea[section]
        guard let smallAreaData = largeAreaData?.smallAreaData, !smallAreaData.isHidden else { return 0 }
        return smallAreaData.areaNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.outputs.largeArea[indexPath.section].smallAreaData.areaNames[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let largeAreaData = viewModel.outputs.largeArea.isEmpty ? nil : viewModel.outputs.largeArea[section]
        let headerView = TableViewHeader.instance(title: largeAreaData?.areaName,
                                                  section: section,
                                                  isHiddenSmallArea: largeAreaData?.smallAreaData.isHidden)
        bindHeaderView(headerView: headerView)
        return headerView
    }
}
