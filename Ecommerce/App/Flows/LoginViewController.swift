//
//  LoginViewController.swift
//  Ecommerce
//
//  Created by Илья on 20.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import SnapKit

class LoginViewController: UIViewController {
    
    
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    lazy var login: UITextField = {
        var login = UITextField()
        login.backgroundColor = .green
        return login
    }()
    
    lazy var password: UITextField = {
        var password = UITextField()
        password.backgroundColor = .green
        return password
    }()
    
    lazy var button: UIButton = {
        var button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        setupAnchorUI()
    }
    
    private func setupSnapkitaUI() {
        view.backgroundColor = .white
        view.addSubview(stack)
        stack.snp.makeConstraints { maker in
            maker.centerX.equalTo(view.snp.centerX)
            maker.centerY.equalTo(view.snp.centerY)
            maker.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        stack.addArrangedSubview(login)
        login.snp.makeConstraints { maker in
            maker.height.equalTo(30)
        }
        
        stack.addArrangedSubview(password)
        password.snp.makeConstraints { maker in
            maker.height.equalTo(30)
        }
        
        stack.addArrangedSubview(button)
        button.snp.makeConstraints { maker in
            maker.height.equalTo(40)
        }
        
        button.addTarget(self, action: #selector(sendMessage), for: .touchDown)
    }
    
    @objc func sendMessage() {

    }
    
    private func setupAnchorUI() {
        view.backgroundColor = .white
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        stack.addArrangedSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        stack.addArrangedSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        stack.addArrangedSubview(button)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
