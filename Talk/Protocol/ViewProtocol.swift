//
//  ViewProtocol.swift
//  Talk
//
//  Created by yk on 7/23/25.
//

import Foundation

@objc protocol ViewProtocol: AnyObject {
    func configureView()
    
    @objc optional func configureData(row : AnyObject)
    @objc optional func configureData(chat: AnyObject)
}
