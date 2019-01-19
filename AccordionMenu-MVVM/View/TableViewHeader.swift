//
//  TableViewHeader.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/16.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

protocol TableViewHeaderOutputs: class {
    var didTapHeaderView: (_ section: Int) -> Void { get set }
}

protocol TableViewHeaderType {
    var outputs: TableViewHeaderOutputs { get }
}

final class TableViewHeader: UIView, TableViewHeaderType {

    @IBOutlet private weak var largeAreaNameLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    var outputs: TableViewHeaderOutputs { return self }
    var didTapHeaderView: (_ section: Int) -> Void = { _ in }
    private(set) var section = 0

    class func instance(title: String?, section: Int, isHiddenSmallArea: Bool?) -> TableViewHeader {
        guard let view = TableViewHeader.nib().instantiate(withOwner: self, options: nil).first as? TableViewHeader else {
            fatalError("failuer get xib")
        }
        view.largeAreaNameLabel.text = title
        view.updateArrowImage(isHidden: isHiddenSmallArea)
        view.section = section
        return view
    }

    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    private func updateArrowImage(isHidden: Bool?) {
        guard let isHidden = isHidden else { return }
        arrowImageView.image = nil
        arrowImageView.image = isHidden ? UIImage(named: "down-arrow") : UIImage(named: "up-arrow")
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        didTapHeaderView(section)
    }

}

extension TableViewHeader: TableViewHeaderOutputs {}
