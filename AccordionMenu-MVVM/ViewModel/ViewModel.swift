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
    var updateTableView: () -> Void { get set }
}

protocol ViewModelType {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

final class ViewModel {

    var updateTableView: () -> Void = {}

}

extension ViewModel: ViewModelType {
    var inputs: ViewModelInputs { return self }
    var outputs: ViewModelOutputs { return self }
}

extension ViewModel: ViewModelInputs {
    func viewDidLoad() {
        
    }
}

extension ViewModel: ViewModelOutputs {}
