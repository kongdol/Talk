//
//  ChatListCollectionViewCell.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        configureView()
        
        ChatDateFormat.sortChatList()
        
        //sortChatListDescending()
    }
    private func configureView() {
        image.layer.cornerRadius = 32
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
    }
    
    // 채팅목록날짜구현
    func configureData(row: ChatRoom) {
        let imgName = row.chatroomImage
        self.image.image = UIImage(named: imgName)
        
        nameLabel.text = row.chatroomName
        chatLabel.text = row.lastMessage
        
        // 채팅방날짜 25.07.13
        dateLabel.text = ChatDateFormat.listLabel(row)
    }
}
