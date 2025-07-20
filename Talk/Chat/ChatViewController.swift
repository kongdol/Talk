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
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        
        let time = ChatList.list[indexPath.item].chatList.last?.date
        
        
        
        if chat.user.name == "김새싹" {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "MyChatTableViewCell", for: indexPath) as! MyChatTableViewCell
            cell.contentLabel.text = chat.message
            
            if time != nil {
                if let dateResult = format.date(from: time!) {
                    let outputFormatter = DateFormatter()
                    outputFormatter.locale = Locale(identifier: "ko_KR")
                    outputFormatter.dateFormat = "hh:mm a"
                    let outputString = outputFormatter.string(from: dateResult)
                    cell.dateLabel.text = outputString
                } else {
                    cell.dateLabel.text = nil
                    print("dateLabel에 nil값이 있어요")
                }
            }
            
            return cell
        } else {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
            
            let img = chat.user.name
            cell.profileImage.image = UIImage(named: img)
            cell.nameLabel.text = chat.user.name
            cell.contentLabel.text = chat.message
            
            
            if time != nil {
                if let dateResult = format.date(from: time!) {
                    let outputFormatter = DateFormatter()
                    outputFormatter.locale = Locale(identifier: "ko_KR")
                    outputFormatter.dateFormat = "hh:mm a"
                    let outputString = outputFormatter.string(from: dateResult)
                    cell.dateLabel.text = outputString
                } else {
                    cell.dateLabel.text = nil
                    print("dateLabel에 nil값이 있어요")
                }
            }
            
            //cell.dateLabel.text = chat.date
            
            return cell
        }
    }
}
