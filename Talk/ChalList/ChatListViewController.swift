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

        let xib = UINib(nibName: cell, bundle: nil)
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: cell)
        
        layout(chatListCollectionView)
       
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        searchTextField.placeholder = "친구 이름을 검색해보세요"
        
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
    }
}

private func layout(_ collectionView: UICollectionView) {
    let layout = UICollectionViewFlowLayout()
    print(collectionView.frame.width)
    layout.itemSize = CGSize(width: collectionView.frame.width, height: 64)
    layout.sectionInset = UIEdgeInsets(top: 16, left: 4, bottom: 16, right: 4)
    layout.minimumLineSpacing = 16
    layout.scrollDirection = .vertical
    
    collectionView.collectionViewLayout = layout
}

extension ChatListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        vc.chatIndex = indexPath.row
    
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChatList.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! ChatListCollectionViewCell
        
        cell.configureData(row: ChatList.list[indexPath.item])
        
        return cell
    }
}
