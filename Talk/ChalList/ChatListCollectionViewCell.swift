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
     
        image.layer.cornerRadius = 32
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        
    }

}
