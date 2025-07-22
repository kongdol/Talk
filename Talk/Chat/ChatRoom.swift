//
//  ChatRoom.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/18/25.
//

import Foundation

//트래블톡 화면에서 사용할 데이터 구조체
struct ChatRoom {
    let chatroomId: Int //채팅방 고유 ID
    let chatroomImage: String //채팅방 이미지
    let chatroomName: String //채팅방 이름
    var chatList: [Chat] = [] //채팅 화면에서 사용할 데이터
    
    // 연산프로퍼티
    // 이렇게쓰는게 맞나 모르겠네요,,,
    var lastTime: String? {
        if chatList.last?.date != nil {
            return chatList.last!.date
        } else {
            return ""
        }
    }
}
