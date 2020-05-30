//
//  AuthorizationPresenter.swift
//  Ecommerce
//
//  Created by Илья on 11.04.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import UIKit

@objc protocol AuthorizationPresenterProtocol {
    func login(username: String, password: String)
}

class AuthorizationPresenter {

    private let view: AuthorizationControllerProtocol
    private let router: AuthorizationRouter
    private let authService: AuthService

    init(view: AuthorizationControllerProtocol, router: AuthorizationRouter, authService: AuthService) {
        self.view = view
        self.router = router
        self.authService = authService
    }

    func requestToServer() -> Int {
        return 10
    }
}

extension AuthorizationPresenter: AuthorizationPresenterProtocol {
    @objc func login(username: String, password: String) {
        view.showError()
    }
}
