//
//  ChatTableViewCell.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

 
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        contentLabel.numberOfLines = 0
        chatContentView.layer.borderWidth = 1
        chatContentView.layer.borderColor = UIColor.gray.cgColor
        chatContentView.layer.cornerRadius = 4
        chatContentView.clipsToBounds = true
    }

   
    
}
