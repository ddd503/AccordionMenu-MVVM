//
//  ViewModel.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import Foundation

protocol ViewModelInputs: class {
    func viewDidLoad()
    func didTapHeader(section: Int)
}

protocol ViewModelOutputs: class {
    var setup: () -> Void { get set }
    var updateTableView: () -> Void { get set }
    var updateTableViewSection: (_ section: Int) -> Void { get set }
    var largeArea: [AreaData.LargeAreaData] { get }
    var largeAreaCount: Int { get }
}

protocol ViewModelType {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

final class ViewModel: ViewModelType {
    var inputs: ViewModelInputs { return self }
    var outputs: ViewModelOutputs { return self }
    var setup: () -> Void = {}
    var updateTableView: () -> Void = {}
    var updateTableViewSection: (_ section: Int) -> Void = { _ in }
    private var areaData: AreaData? {
        didSet {
            updateTableView()
        }
    }
}

extension ViewModel: ViewModelInputs {
    func viewDidLoad() {
        setup()
        areaData = DataStore.getAreaData()
    }
    func didTapHeader(section: Int) {
        guard var areaData = areaData else { return }
        areaData.largeAreaData[section].smallAreaData.isHidden.toggle()
        updateTableViewSection(section)
    }
}

extension ViewModel: ViewModelOutputs {
    var largeArea: [AreaData.LargeAreaData] { return areaData?.largeAreaData ?? [] }
    var largeAreaCount: Int { return areaData?.largeAreaData.count ?? 0 }
}
