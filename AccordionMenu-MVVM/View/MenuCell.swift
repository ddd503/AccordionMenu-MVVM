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

    static var identifier: String {
        return String(describing: self)
    }

    @IBAction private func accordionAction(_ sender: UIButton) {

    }

}
