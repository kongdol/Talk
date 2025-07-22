//
//  ChatViewController.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    
    var chatIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: "ChatTableViewCell")
        
        let myxib = UINib(nibName: "MyChatTableViewCell", bundle: nil)
        chatTableView.register(myxib, forCellReuseIdentifier: "MyChatTableViewCell")
        
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
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "MyChatTableViewCell", for: indexPath) as! MyChatTableViewCell
            
            cell.configureData(row: chat)
            
            return cell
        } else {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
            
            cell.configureData(chat: chat)
            
            return cell
        }
    }
}
