//
//  AreaData.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/03.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

struct AreaData: Codable {
    let largeAreaData: [LargeAreaData]
}

extension AreaData {
    struct LargeAreaData: Codable {
        let areaName: String
        let smallAreaData: SmallAreaData
    }
}

extension AreaData.LargeAreaData {
    struct SmallAreaData: Codable {
        let areaNames: [String]
    }
}
