//
//  ViewController.swift
//  Ecommerce
//
//  Created by Илья on 08.04.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import UIKit

@objc protocol AuthorizationControllerProtocol {
    func showError()
}

class AuthorizationController: UIViewController, AuthorizationControllerProtocol {

    var presenter: AuthorizationPresenterProtocol!
    @IBOutlet weak var label: UILabel!
    //var assembler: AuthorizationAssembly!
    let socket = MessageService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.subscribe(subscriber: self, method: "getMessages") { json in
            DispatchQueue.main.async {
                self.label.text = json.stringValue
            }
        }
    }

    var value = 0
    
    @IBAction func sendEvent(_ sender: Any) {
        value += 1
        socket.createMessage(text: String(describing: value)) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func inputEmail(value: Int,
                    valueFirst: Int,
                    valueThird: Int,
                    valueFourth: Int,
                    valueFives: Int,
                    valueSix: Int) {

    }

    func inputPassword() {

    }

    func configure_UI() {

    }

    func configureConstraintInput() {

    }

    func login(username: String, password: String) {
        presenter.login(username: username, password: password)
    }

    func showError() {

    }
}

/*class Rectangle {
    var centerX: Int?
    var centerY: Int?
    
    var isCenter: Bool
    
    func calculate() -> CGPoint {
        if let centerX = centerX, let centerY = centerY {
            let calculatedCenter = CGPoint(x: centerX, y: centerY)
        }
    }
    
}*/
