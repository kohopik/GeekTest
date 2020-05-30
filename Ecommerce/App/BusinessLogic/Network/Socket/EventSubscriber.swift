//
//  EventSubscriber.swift
//  Ecommerce
//
//  Created by Илья on 27.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import Starscream
import SwiftyJSON
import Foundation

class EventSubscriber {
    var id: Int
    
    var name: String
    
    var handler: (JSON) -> Void
    
    init(id: Int, name: String, handler: @escaping (JSON) -> Void) {
        self.id = id
        self.name = name
        self.handler = handler
    }
}
