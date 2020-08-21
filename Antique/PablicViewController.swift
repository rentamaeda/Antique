//
//  PablicViewController.swift
//  Antique
//
//  Created by user on 2020/08/12.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
class PablicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    // 投稿データを格納する配列
       var postArray: [PostData] = []
    // Firestoreのリスナー
      var listener: ListenerRegistration!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
               tableView.dataSource = self

               // カスタムセルを登録する
               let nib = UINib(nibName: "TableViewCell", bundle: nil)
               tableView.register(nib, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    
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
                       // TableViewの表示を更新する
                       self.tableView.reloadData()
                   }
               }
           } else {
               // ログイン未(またはログアウト済み)
               if listener != nil {
                   // listener登録済みなら削除してpostArrayをクリアする
                   listener.remove()
                   listener = nil
                   postArray = []
                   tableView.reloadData()
               }
           }
 
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return postArray.count
      }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setPostData(postArray[indexPath.row])

        return cell
    }

}
