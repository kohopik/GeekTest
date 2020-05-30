//
//  MessageService.swift
//  Ecommerce
//
//  Created by Илья on 23.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import SwiftyJSON


protocol MessageServiceAbstract {
    func createMessage(text: String, response: @escaping (Result<Bool,Error>) -> Void)
}

class MessageService: MessageServiceAbstract {
    
    private var socket: SocketServer
    
    init() {
        socket = SocketServer()
    }
    
    func connect() {
        socket.connect()
    }
    
    func createMessage(text: String, response: @escaping (Result<Bool, Error>) -> Void) {
        socket.request(method: "chat/addMessage", data: ["message": AnyEncodable(value: text)]) { result in
            switch result {
            case .failure(let error):
                response(.failure(error))
            case .success(let data):
                response(.success(data.boolValue))
            }
        }
    }
    
    func createChat(text: String, response: @escaping (Result<Bool, Error>) -> Void) {
        socket.request(method: "chat/createChat", data: ["message": AnyEncodable(value: text)]) { result in
            switch result {
            case .failure(let error):
                response(.failure(error))
            case .success(let data):
                response(.success(data.boolValue))
            }
        }
    }
    
    func subscribe(subscriber: AnyObject, method: String, response: @escaping ((JSON) -> Void)) {
        socket.subscribe(subscriber: subscriber, method: method, response: response)
    }
    
    func unsubscribe(subscriber: AnyObject, method: String) {
        socket.unsubscribe(subscriber: subscriber, method: method)
    }
}
