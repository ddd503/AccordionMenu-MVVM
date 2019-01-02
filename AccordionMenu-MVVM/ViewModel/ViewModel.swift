//
//  ViewModel.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

protocol ViewModelInputs: class {

}

protocol ViewModelOutputs: class {

}

protocol ViewModelType {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

final class ViewModel {}

extension ViewModel: ViewModelType {
    var inputs: ViewModelInputs { return self }
    var outputs: ViewModelOutputs { return self }
}

extension ViewModel: ViewModelInputs {}

extension ViewModel: ViewModelOutputs {}
