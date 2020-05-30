//
//  SocketRequest.swift
//  Ecommerce
//
//  Created by Илья on 20.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import SwiftyJSON

class SocketRequest: Encodable {
    var id: String
    var data: [String: AnyEncodable]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case data
    }
    
    typealias SocketCallback = ((Result<JSON, Error>) -> Void)?
    var callback: SocketCallback
    
    init(id: String, data: [String: AnyEncodable]?, callback: SocketCallback) {
        self.id = id
        self.data = data
        self.callback = callback
    }
}

struct AnyEncodable: Encodable {
    let value: Encodable
    init(value: Encodable) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
    
    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
