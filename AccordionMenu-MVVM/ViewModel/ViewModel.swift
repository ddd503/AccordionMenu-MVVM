//
//  ViewModel.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

protocol ViewModelInputs: class {
    func viewDidLoad()
}

protocol ViewModelOutputs: class {
    var setup: () -> Void { get set }
    var updateTableView: () -> Void { get set }
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
    private var areaData: AreaData?
}

extension ViewModel: ViewModelInputs {
    func viewDidLoad() {
        areaData = DataStore.getAreaData()
        setup()
    }
}

extension ViewModel: ViewModelOutputs {
    var largeArea: [AreaData.LargeAreaData] { return areaData?.largeAreaData ?? [] }
    var largeAreaCount: Int { return areaData?.largeAreaData.count ?? 0 }
}
