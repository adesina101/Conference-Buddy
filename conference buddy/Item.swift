//
//  Item.swift
//  conference buddy
//
//  Created by Abdussalam Adesina on 4/29/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
