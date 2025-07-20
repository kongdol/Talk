//
//  ChatListViewController.swift
//  Talk
//
//  Created by yk on 7/20/25.
//

import UIKit
import Kingfisher

class ChatListViewController: UIViewController {
    
    
    
    let cell = "ChatListCollectionViewCell"

    @IBOutlet var chatListCollectionView: UICollectionView!
    
    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.placeholder = "친구 이름을 검색해보세요"

        let xib = UINib(nibName: cell, bundle: nil)
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: cell)
        
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        print(chatListCollectionView.frame.width)
        layout.itemSize = CGSize(width: chatListCollectionView.frame.width, height: 64)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 4, bottom: 16, right: 4)
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        chatListCollectionView.collectionViewLayout = layout
        sortChatListDescending()
        
    }
    


}

extension ChatListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        vc.chatIndex = indexPath.row
        
        present(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChatList.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! ChatListCollectionViewCell
        
        let imgName = ChatList.list[indexPath.item].chatroomImage
        cell.image.image = UIImage(named: imgName)
        
        cell.nameLabel.text = ChatList.list[indexPath.item].chatroomName
        cell.chatLabel.text = ChatList.list[indexPath.item].chatList.last?.message
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        let a = ChatList.list[indexPath.item].chatList.last?.date
        
        if a != nil {
            if let dateResult = format.date(from: a!) {
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "yy.MM.dd"
                let outputString = outputFormatter.string(from: dateResult)
                cell.dateLabel.text = outputString
            } else {
                cell.dateLabel.text = nil
                print("dateLabel에 nil값이 있어요")
            }
        }
        return cell
    }
    
    func sortChatListDescending() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            
            let count = ChatList.list.count
            //count = 8
        
            for i in 0 ..< count {
                for j in i+1 ..< count {
                    let firstDateString = ChatList.list[i].chatList.last?.date
                    let secondDateString = ChatList.list[j].chatList.last?.date
                    
                       if let firstDate = dateFormatter.date(from: firstDateString!),
                       let secondDate = dateFormatter.date(from: secondDateString!) {
                        
                        // 최신날짜를 뒤(j)에서 앞(i)위치로오게
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
