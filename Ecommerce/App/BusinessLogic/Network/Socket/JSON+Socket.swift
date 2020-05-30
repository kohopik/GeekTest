//
//  JSON+Socket.swift
//  Ecommerce
//
//  Created by Илья on 23.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import Foundation

extension String {
    /// Convert string to json dictionary.
    func jsonDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    /// Get objects array from json string.
    func getJsonArray<T: Decodable>(type: T) -> [T] {
        guard let data = self.data(using: .utf8) else {
            return [T]()
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        guard let json = try? decoder.decode([T].self, from: data) else {
            return [T]()
        }

        return json
    }

    /// Get json object from string.
    func getJson<T: Decodable>(type: T.Type) -> T? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try? decoder.decode(type, from: data)
    }
}
