//
//  ThreadSafeRequest.swift
//  Ecommerce
//
//  Created by Илья on 27.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import Starscream
import SwiftyJSON
import Foundation

class ThreadSafeRequests {
    private var requests = [SocketRequest]()
    
    private var queue = DispatchQueue(label: "com.requests", attributes: .concurrent)
    
    func get() -> [SocketRequest] {
        var results = [SocketRequest]()
        queue.sync {
            results = requests
        }
        return results
    }
    
    func append(_ request: SocketRequest) {
        queue.async(flags: .barrier) {
            self.requests.append(request)
        }
    }
    
    func first(_ condition: (SocketRequest) -> (Bool)) -> SocketRequest? {
        var results: SocketRequest?
        queue.sync {
            results = requests.first(where: condition)
        }
        return results
    }
    
    func contains(_ condition: (SocketRequest) -> (Bool)) -> Bool {
        var results = false
        queue.sync {
            results = requests.contains(where: condition)
        }
        return results
    }
    
    func removeAll() {
        requests.removeAll()
    }
    
    func removeAll(_ condition: @escaping (SocketRequest) -> (Bool)) {
        queue.async(flags: .barrier) {
            self.requests.removeAll(where: condition)
        }
    }
}
