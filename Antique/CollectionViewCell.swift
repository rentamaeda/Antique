//
//  CollectionViewCell.swift
//  Antique
//
//  Created by user on 2020/08/04.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import FirebaseUI

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
   
    @IBOutlet weak var ImageHeight: NSLayoutConstraint!
    @IBOutlet weak var ImageWidth: NSLayoutConstraint!
    

    // PostDataの内容をセルに表示
       func setPostData(_ postData: PostData) {
           // 画像の表示
           imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
           let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
           imageView.sd_setImage(with: imageRef)

           // キャプションの表示
         self.priceLabel.text = "\(postData.name!) : \(postData.caption!)"

           // 日時の表示
         self.brandLabel.text = "\(postData.date!)"
     }
}
