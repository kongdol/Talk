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
        
        configureView()
    }
    
    //MARK: 변수이름같은거 포문?
    private func configureView() {
        contentLabel.numberOfLines = 0
        myContentView.myBubbleView()
        dateLabel.bubbleDate()
    }
    
    func configureData(row: Chat) {
        contentLabel.text = row.message
        dateLabel.text = ChatDateFormat.chatDate(row)
    }
}

