//
//  AbstractErrorParser.swift
//  Ecommerce
//
//  Created by Илья on 11.04.2020.
//  Copyright © 2020 Илья. All rights reserved.
//
import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
