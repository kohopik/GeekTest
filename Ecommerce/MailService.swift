//
//  MailService.swift
//  Ecommerce
//
//  Created by Илья on 11.04.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

protocol MailService {

}

class YandexService: MailService {

}

class GoogleService: MailService {

}

class MailPresenter {
    private let mailService: MailService

    init(mailService: MailService) {
        self.mailService = mailService
    }
}
