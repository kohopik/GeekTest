//
//  ChatMessageCell.swift
//  Ecommerce
//
//  Created by Илья on 20.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import AsyncDisplayKit

class ChatMessageCell: ASCellNode {
    
    let avatar = ASNetworkImageNode()
    let message = ASTextNode()
    let username = ASTextNode()
    let time = ASTextNode()
    
    init(message: String, username: String, time: String) {
        super.init()
        self.backgroundColor = .white
        self.isOpaque = true
        
        self.message.attributedText = NSAttributedString(string: message)
        self.message.style.flexShrink = 1
        self.username.attributedText = NSAttributedString(string: username)
        self.time.attributedText = NSAttributedString(string: time)
        self.avatar.style.preferredSize = .init(width: 40, height: 40)
        self.avatar.shouldCacheImage = true
        self.avatar.url = URL(string: "https://texturegroup.org/static/images/logo.svg")
        
        addSubnode(self.message)
        addSubnode(self.username)
        addSubnode(self.time)
        addSubnode(self.avatar)
        
        enableSubtreeRasterization()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let headerContainer = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 15,
                                                justifyContent: .spaceBetween,
                                                alignItems: .stretch,
                                                children: [username, time])
        
        let mainContainer = ASStackLayoutSpec(direction: .vertical,
                                              spacing: 7,
                                              justifyContent: .start,
                                              alignItems: .stretch,
                                              children: [headerContainer, message])
        mainContainer.flexWrap = .wrap
        mainContainer.style.flexShrink = 1
        mainContainer.style.flexGrow = 1
        
        
        let container = ASStackLayoutSpec(direction: .horizontal,
                                          spacing: 7,
                                          justifyContent: .spaceBetween,
                                          alignItems: .stretch,
                                          children: [avatar, mainContainer])
        return container
    }
    
}
