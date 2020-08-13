//
//  TitleViewController.swift
//  Antique
//
//  Created by user on 2020/08/12.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import SVProgressHUD
import FirebaseAuth
class TitleViewController: UIViewController {
    @IBOutlet weak var TitleTextField: UITextField!
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBAction func SelectButton(_ sender: Any) {
        // 画像と投稿データの保存場所を定義する
        let postRef = Firestore.firestore().collection(Const.PostPath).document()
        // HUDで投稿処理中の表示を開始
               SVProgressHUD.show()
        // FireStoreに投稿データを保存する
                  let name = Auth.auth().currentUser?.displayName
                  let postDic = [
                      "name": name!,
                      "caption": self.TitleTextField.text!,
                      "date": DatePicker.date,
                      ] as [String : Any]
                  postRef.setData(postDic)
                  // HUDで投稿完了を表示する
                  SVProgressHUD.showSuccess(withStatus: "投稿しました")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
