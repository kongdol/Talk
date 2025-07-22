//
//  ChatDateFormat.swift
//  Talk
//
//  Created by yk on 7/22/25.
//

import UIKit

struct ChatDateFormat {
    static var inputFormat: DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        return format
    }
    // 채팅목록날짜
    static func listLabel(_ row: ChatRoom) -> String {
        if let lastTime = row.lastTime {
            guard let dateResult = ChatDateFormat.inputFormat.date(from: lastTime) else {
                print("dateResult가 없어요")
                return ""
            }
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yy.MM.dd"
            let outputString = outputFormatter.string(from: dateResult)
            return outputString
        }
        print("lastTime이 없어요")
        return ""
    }
    
    // 채팅방 날짜 (나, 상대)
    static func chatDate(_ row: Chat) -> String {
        if let dateResult = ChatDateFormat.inputFormat.date(from: row.date) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "ko_KR")
            outputFormatter.dateFormat = "hh:mm a"
            let outputString = outputFormatter.string(from: dateResult)
            return outputString
        } else {
            return "채팅날짜가이상해요"
        }
    }
    
    // 채팅목록최신순
    static func sortChatList() {
        let count = ChatList.list.count
        
        for i in 0 ..< count {
            for j in i+1 ..< count {
                let firstDateString = ChatList.list[i].chatList.last?.date
                let secondDateString = ChatList.list[j].chatList.last?.date
                
                if let firstDate = ChatDateFormat.inputFormat.date(from: firstDateString!),
                   let secondDate = ChatDateFormat.inputFormat.date(from: secondDateString!) {
                    
                    if firstDate < secondDate {
                        let temp = ChatList.list[i]
                        ChatList.list[i] = ChatList.list[j]
                        ChatList.list[j] = temp
                    }
                }
                   
            }
        }
        
    }
  
    
    
    
    
}
