//
//  MyChatTableViewCell.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    
   
    @IBOutlet var myContentView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        contentLabel.numberOfLines = 0
        
        myContentView.backgroundColor = .systemGray5
        myContentView.layer.borderWidth = 1
        myContentView.layer.borderColor = UIColor.gray.cgColor
        myContentView.layer.cornerRadius = 8
        myContentView.clipsToBounds = true
        
        dateLabel.font = UIFont.systemFont(ofSize: 11)
        dateLabel.textColor = .gray
    }

}
