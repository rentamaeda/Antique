//
//  ViewController.swift
//  Antique
//
//  Created by user on 2020/08/04.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//画像の名前の配列
var images = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]

//値段の配列
var prices = ["¥7800","¥23,000","¥36,000","¥4500","¥9650","¥6700","¥7500","¥9800","¥29,000","¥10,600","¥11,000","¥3120","¥1350","¥14,900","¥32,000"]

//ブランド名の配列
var brands = ["Patagonia","A BATHING APE","nano・universe","green label relaxing","antiqua","Tommorowland","Felissimo","Aula","Bal","Fred Perry","Grandier","HUGO","Jackman","KBF","Lazar"]
 //カートにつなぐ変数
    var selectedImage : UIImage?
    var selectedPrice : String?
    var selectedBrand : String?

    @IBOutlet weak var CollecionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollecionView.delegate = self
        self.CollecionView.dataSource = self
    }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              return 13 //追加
          }
        func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 1
          }
   
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              //①
              let cell = self.CollecionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! CollectionViewCell
              //②
              cell.imageView.image = UIImage(named: self.images[indexPath.row])
              //③
              cell.priceLabel.text = self.prices[indexPath.row]
              //④
              cell.brandLabel.text = self.brands[indexPath.row]
              cell.ImageWidth.constant = UIScreen.main.bounds.width/3-30
              cell.ImageHeight.constant = 150
             
         
            //⑤
             return cell
                       
          }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
                 selectedImage = UIImage(named: images[indexPath.row])
                selectedPrice = self.prices[indexPath.row]
                selectedBrand = self.brands[indexPath.row]
                 if selectedImage != nil {
                     // SubViewController へ遷移するために Segue を呼び出す
                     performSegue(withIdentifier: "Cart",sender: nil)
                 }
     
                    
    }
        // Segue 準備
        override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
            if (segue.identifier == "Cart") {
                let subVC: CartViewController = (segue.destination as? CartViewController   )!

                // SubViewController のselectedImgに選択された画像を設定する
                subVC.selectedImg = selectedImage
                subVC.selectedPrc = selectedPrice
                subVC.selectedBrd = selectedBrand
            }
        }
    }

