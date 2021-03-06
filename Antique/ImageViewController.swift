//
//  ImageViewController.swift
//  Antique
//
//  Created by user on 2020/08/12.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import CLImageEditor
import Firebase
import FirebaseStorage
import SVProgressHUD
import FirebaseAuth
class ImageViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
CLImageEditorDelegate {
    var localImages: [UIImage] = []
//    // 投稿データを格納する配列
      var postArray: [PostData] = []

       // Firestoreのリスナー
//       var listener: ListenerRegistration!

    override func viewDidLoad() {
        super.viewDidLoad()
//           self.collectionView.delegate = self
//           self.collectionView.dataSource = self
       }
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func doneButton(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)

    }
    @IBAction func addButton(_ sender: Any) {
        // ライブラリ（カメラロール）を指定してピッカーを開く
                     if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                         let pickerController = UIImagePickerController()
                         pickerController.delegate = self
                         pickerController.sourceType = .photoLibrary
                         self.present(pickerController, animated: true, completion: nil)
                     }
    }
   
     // 写真を撮影/選択したときに呼ばれるメソッド
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if info[.originalImage] != nil {
            //画像取得
            let image = info[.originalImage] as! UIImage
            localImages.append(info[.originalImage] as! UIImage)

            // 画像をJPEG形式に変換する
            let imageData = image.jpegData(compressionQuality: 0.75)
             // 画像と投稿データの保存場所を定義する
            let imageRef = Storage.storage().reference().child(Const.ImagePath).child(".jpg")
            // HUDで投稿処理中の表示を開始
            SVProgressHUD.show()
            // Storageに画像をアップロードする
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            imageRef.putData(imageData!, metadata: metadata) { (metadata, error) in
                if error != nil {
                    // 画像のアップロード失敗
                    print(error!)
                    SVProgressHUD.showError(withStatus: "画像のアップロードが失敗しました")
                    // 投稿処理をキャンセルし、先頭画面に戻る
                    UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
                    return
                }
                // HUDで投稿完了を表示する
                          SVProgressHUD.showSuccess(withStatus: "投稿しました")
                         self.dismiss(animated: true, completion: nil)

/*               // 撮影/選択された画像を取得する
               let image = info[.originalImage] as! UIImage

               // あとでCLImageEditorライブラリで加工する
               print("DEBUG_PRINT: image = \(image)")
               // CLImageEditorにimageを渡して、加工画面を起動する。
               let editor = CLImageEditor(image: image)!
               editor.delegate = self
               editor.modalPresentationStyle = .fullScreen
               picker.present(editor, animated: true, completion: nil)
 */
           }
       }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                postArray.count
            }
          func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 1
            }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! MainCollectionViewCell
          cell.setPostData(postArray[indexPath.row])
//          cell.ImageWidth.constant = UIScreen.main.bounds.width/3-30
 //                      cell.ImageHeight.constant = 150
                      
                 return cell
            
       }
 
    // CLImageEditorで加工が終わったときに呼ばれるメソッド
       func imageEditor(_ editor: CLImageEditor!, didFinishEditingWith image: UIImage!) {
        
        //ImageView.image = image!
       }
    // CLImageEditorの編集がキャンセルされた時に呼ばれるメソッド
      func imageEditorDidCancel(_ editor: CLImageEditor!) {
          // ImageSelectViewController画面を閉じてタブ画面に戻る
          self.presentingViewController?.dismiss(animated: true, completion: nil)
      }
   
}
