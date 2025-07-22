//
//  UIView+Extension.swift
//  Talk
//
//  Created by yk on 7/23/25.
//
import UIKit

extension UIView {
    func myBubbleView() {
        self.backgroundColor = .systemGray5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    func otherBubbleView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}

extension UILabel {
    func bubbleDate() {
        self.font = UIFont.systemFont(ofSize: 11)
        self.textColor = .gray
    }
    
}
