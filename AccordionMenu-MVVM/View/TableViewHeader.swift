//
//  TableViewHeader.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/16.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

final class TableViewHeader: UIView {

    @IBOutlet private weak var largeAreaNameLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    private(set) var section = 0

    class func instance(title: String?, section: Int) -> TableViewHeader {
        guard let view = TableViewHeader.nib().instantiate(withOwner: self, options: nil).first as? TableViewHeader else {
            fatalError("failuer get xib")
        }
        view.largeAreaNameLabel.text = title
        view.section = section
        return view
    }

    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
