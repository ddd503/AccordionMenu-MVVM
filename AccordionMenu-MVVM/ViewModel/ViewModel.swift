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
}

extension ViewModel: ViewModelInputs {
    func viewDidLoad() {
        setup()
    }
}

extension ViewModel: ViewModelOutputs {}
