//
//  MenuCell.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/14.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

final class MenuCell: UITableViewCell {

    @IBOutlet private weak var largeAreaView: UIView!
    @IBOutlet private weak var smallAreaView: UIView!
    @IBOutlet private weak var largeAreaLabel: UILabel!
    @IBOutlet private weak var smallAreaLabel: UILabel!
    private var viewModel: ViewModel!

    static var identifier: String {
        return String(describing: self)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        smallAreaView.isHidden = true
    }

    func setupMenuCell(viewModel: ViewModel, largeAreaData: AreaData.LargeAreaData) {
        self.viewModel = viewModel
        bindViewModel()
        DispatchQueue.main.async {
            self.largeAreaLabel.text = largeAreaData.areaName
        }
    }

    private func bindViewModel() {
        viewModel.outputs.switchAccordionState = { [weak self] in
            DispatchQueue.main.async {
                self?.smallAreaView.isHidden.toggle()
            }
        }
    }

    @IBAction private func accordionAction(_ sender: UIButton) {
        viewModel.inputs.tapAccordionButton()
    }

}
