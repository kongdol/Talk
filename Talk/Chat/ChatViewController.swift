//
//  ChatViewController.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit

enum CellType: String {
    case other = "ChatTableViewCell"
    case me = "MyChatTableViewCell"
    
    // 연산프로퍼티
    var nib: UINib {
        return UINib(nibName: self.rawValue, bundle: nil)
    }
    
    var identifier: String {
        return self.rawValue
    }
    
    func register(_ tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeue (_ tableView: UITableView, indexPath: IndexPath, chat: Chat) -> UITableViewCell {
        switch self {
        case .other:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ChatTableViewCell
            cell.configureData(chat: chat)
            return cell
        case .me:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyChatTableViewCell
            cell.configureData(row: chat)
            return cell
        }

        
    }
}

class ChatViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    
    var chatIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        CellType.other.register(chatTableView)
        CellType.me.register(chatTableView)
    
        navigationItem.title = ChatList.list[chatIndex].chatroomName
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
}

extension ChatViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ChatList.list[chatIndex].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatRoom = ChatList.list[chatIndex]
        let chat = chatRoom.chatList[indexPath.row]
        
        if chat.user.name == "김새싹" {
            let cell = CellType.me.dequeue(chatTableView, indexPath: indexPath, chat: chat)
    
            return cell
        } else {
            let cell = CellType.other.dequeue(chatTableView, indexPath: indexPath, chat: chat)
            
            return cell
        }
    }
}
