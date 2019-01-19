//
//  DataStore.swift
//  AccordionMenu-MVVM
//
//  Created by kawaharadai on 2019/01/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import Foundation

final class DataStore {
    static func getAreaData() -> AreaData {
        guard let filePath = Bundle.main.path(forResource: "areaData", ofType: "json") else { fatalError() }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let response = try decoder.decode(AreaData.self, from: jsonData)
            return response
        } catch { fatalError("Failed to get areaData") }
    }
}
