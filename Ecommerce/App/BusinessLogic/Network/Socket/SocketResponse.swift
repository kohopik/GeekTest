//
//  SocketResponse.swift
//  Ecommerce
//
//  Created by Илья on 20.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import SwiftyJSON

class SocketResponse: Codable {
    var id: String
    var event: String?
    var error: String?
    var result: JSON?
}
