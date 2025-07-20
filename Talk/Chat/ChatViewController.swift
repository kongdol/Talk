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
        
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
       
    }
}

extension ChatViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatList.list[chatIndex].chatList.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        let chatRoom = ChatList.list[chatIndex]
        let chat = chatRoom.chatList[indexPath.row]
        
        //print(indexPath.row)
        //print(chatList)
        let img = chat.user.name
        cell.profileImage.image = UIImage(named: img)
        cell.nameLabel.text = chat.user.name
        cell.contentLabel.text = chat.message
        cell.dateLabel.text = chat.date
        
        
        return cell
    }
    
    
}
