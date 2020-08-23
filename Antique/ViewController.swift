//
//  ViewController.swift
//  Antique
//
//  Created by user on 2020/08/04.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    var postArray: [PostData] = []

    var listener: ListenerRegistration!

    @IBOutlet weak var CollecionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.CollecionView.delegate = self
             self.CollecionView.dataSource = self
    }
    @IBAction func addActionButton(_ sender: Any) {
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            postArray.count
        
    }
   func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
     }
/*
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               //①
               let cell = self.CollecionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! CollectionViewCell
               //②
        cell.imageView.image = UIImage(named: self.images[indexPath.row])
                   return cell
 
        
    }
 */
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           print("DEBUG_PRINT: viewWillAppear")

           if Auth.auth().currentUser != nil {
               // ログイン済み
               if listener == nil {
                   // listener未登録なら、登録してスナップショットを受信する
                   let postsRef = Firestore.firestore().collection(Const.PostPath).order(by: "date", descending: true)
                   listener = postsRef.addSnapshotListener() { (querySnapshot, error) in
                       if let error = error {
                           print("DEBUG_PRINT: snapshotの取得が失敗しました。 \(error)")
                           return
                       }
                       // 取得したdocumentをもとにPostDataを作成し、postArrayの配列にする。
                       self.postArray = querySnapshot!.documents.map { document in
                           print("DEBUG_PRINT: document取得 \(document.documentID)")
                           let postData = PostData(document: document)
                           return postData
                       }
                       // CollecionViewの表示を更新する
                       self.CollecionView.reloadData()
                   }
               }
           } else {
               // ログイン未(またはログアウト済み)
               if listener != nil {
                   // listener登録済みなら削除してpostArrayをクリアする
                   listener.remove()
                   listener = nil
                   postArray = []
                
                   self.CollecionView.reloadData()
               }
           }
       }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! CollectionViewCell
        cell.setPostData(postArray[indexPath.row])
        cell.ImageWidth.constant = UIScreen.main.bounds.width/3-30
                     cell.ImageHeight.constant = 150
                    
               return cell
          
     }
    // Cell が選択された場合
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! CollectionViewCell
       //    cell.setPostData(postArray[indexPath.row])
                           // SubViewController へ遷移するために Segue を呼び出す
                           performSegue(withIdentifier: "Model",sender: nil)
                       
           //collectionViewにライブラリで選択した画像を表示させる

           
       }
}

