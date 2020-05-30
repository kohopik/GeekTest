//
//  AsyncDisplayController.swift
//  Ecommerce
//
//  Created by Илья on 20.05.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import AsyncDisplayKit

final class MessageController: ASViewController<ASDisplayNode> {
    
    lazy var mainNode: ASTableNode = {
        return node as! ASTableNode
    }()
    
    init() {
        super.init(node: ASTableNode(style: .plain))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        mainNode.dataSource = self
    }
}

extension MessageController: ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { ChatMessageCell(message: "awrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiaweawrgaweiogoawegawejgmoiawe",
                                 username: "testUsername",
                                 time: "at 10:00")}
    }
}
