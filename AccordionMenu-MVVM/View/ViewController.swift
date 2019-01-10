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
            // call startup methods
        }
        viewModel.outputs.updateTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

