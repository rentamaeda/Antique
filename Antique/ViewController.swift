//
//  ViewController.swift
//  Antique
//
//  Created by user on 2020/08/04.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
var images = ["1"]
  
    @IBOutlet weak var CollecionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.CollecionView.delegate = self
             self.CollecionView.dataSource = self
    }
    @IBAction func addActionButton(_ sender: Any) {
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                 return 1 //追加
             }
   func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
     }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               //①
               let cell = self.CollecionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! CollectionViewCell
               //②
        cell.imageView.image = UIImage(named: self.images[indexPath.row])
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

