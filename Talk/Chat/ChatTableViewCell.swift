//
//  ChatTableViewCell.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit

class ChatTableViewCell: UITableViewCell, ViewProtocol {
 
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        configureView()
    }
    
    func configureView() {
        contentLabel.numberOfLines = 0
        
        dateLabel.bubbleDate()
        
        
        chatContentView.otherBubbleView()
    }

    func configureData(chat: Chat) {
        let img = chat.user.image
        profileImage.image = UIImage(named: img)
        nameLabel.text = chat.user.name
        contentLabel.text = chat.message
        
        dateLabel.text = ChatDateFormat.chatDate(chat)
    }
}



