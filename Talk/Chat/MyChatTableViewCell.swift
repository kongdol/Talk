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
        myContentView.backgroundColor = .systemGray5
        myContentView.layer.borderWidth = 1
        myContentView.layer.borderColor = UIColor.gray.cgColor
        myContentView.layer.cornerRadius = 8
        myContentView.clipsToBounds = true
        
        dateLabel.font = UIFont.systemFont(ofSize: 11)
        dateLabel.textColor = .gray
    }
    
    func configureData(row: Chat) {
        contentLabel.text = row.message
        dateLabel.text = ChatDateFormat.chatDate(row)
        
    }
}
