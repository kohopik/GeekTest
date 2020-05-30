//
//  SocketClient.swift
//  Ecommerce
//
//  Created by Илья on 20.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import Starscream
import SwiftyJSON
import Foundation

enum SocketStatus {
    case connected
    case disconnected
    case connecting
}

enum SocketError: Error {
    case none
}

fileprivate class Socket {
    
    static let shared = Socket()
    private var socket: WebSocket?
    private var requests = ThreadSafeRequests()
    private var subscribers = [EventSubscriber]()
    
    func configureSocket() {
        let url = URL(string: "ws://localhost:8080/")!
        let request = URLRequest(url: url)
        socket = WebSocket(request: request)
        socket?.callbackQueue = DispatchQueue.global(qos: .utility)
        socket?.onEvent = { event in
            switch event {
            case .connected(let dictionary):
                print(dictionary)
            case let .disconnected(message, statusCode):
                print(message)
            case let .text(text):
                guard let response = text.getJson(type: SocketResponse.self) else { return }
                
                if response.event != nil {
                    self.handleEvent(response: response)
                } else {
                    self.handleResponse(response: response)
                }
            case let .error(error):
                print(error)
            default: break
            }
        }
    }
    
    func handleEvent(response: SocketResponse) {
        guard let json = response.result else {
            return
        }
        
        subscribers.filter { $0.name == response.event }.forEach { $0.handler(json) }
    }
    
    func handleResponse(response: SocketResponse) {
        defer {
            requests.removeAll { $0.id == response.id }
        }
        
        let request = self.requests.first { $0.id == response.id }
        
        if let error = response.error {
            request?.callback?(.failure(SocketError.none))
            return
        }
        
        guard let data = response.result else {
            request?.callback?(.success(JSON()))
            return
        }
        
        request?.callback?(.success(data))
    }
    
    func connect() {
        socket?.connect()
    }
    
    func makeRequest(request: SocketRequest, method: String) {
        requests.append(request)
        
        let encoder = JSONEncoder()
        if let requestEncoded = try? encoder.encode(request),
            let message = String(bytes: requestEncoded, encoding: .utf8) {
            socket?.write(string: method + "/" + message)
        }
    }
    
    func subscribe(subscriber: EventSubscriber) {
        subscribers.append(subscriber)
    }
    
    func unsubscribe(subscriber: AnyObject, method: String) {
        subscribers.removeAll { $0.id == subscriber.hash && $0.name == method }
    }
}

class SocketServer {
    
    func connect() {
        Socket.shared.configureSocket()
        Socket.shared.connect()
    }
    
    func request(method: String, data: [String: AnyEncodable]?, response: @escaping ((Result<JSON,Error>) -> Void)) {
        let request = SocketRequest(id: UUID().uuidString,
                                    data: data,
                                    callback: response)
        Socket.shared.makeRequest(request: request, method: method)
    }
    
    func subscribe(subscriber: AnyObject, method: String, response: @escaping ((JSON) -> Void)) {
        let eventSubscriber = EventSubscriber(id: subscriber.hash, name: method, handler: response)
        Socket.shared.subscribe(subscriber: eventSubscriber)
    }
    
    func unsubscribe(subscriber: AnyObject, method: String) {
        Socket.shared.unsubscribe(subscriber: subscriber, method: method)
    }
}
