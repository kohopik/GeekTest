//
//  AuthorizationRouter.swift
//  Ecommerce
//
//  Created by Илья on 11.04.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import UIKit

class AuthorizationRouter {
    var view: UIViewController

    init(view: UIViewController) {
        self.view = view
    }

    func goToFacebook() {
        var viewController = AuthorizationController()
        //viewController.assembler = AuthorizationAssembly(view: viewController)
        // present viewController
    }

    func goToGoogle() {
        var viewController = AuthorizationController()
        //viewController.assembler = AuthorizationAssembly(view: viewController)
        // present viewController
    }
}
