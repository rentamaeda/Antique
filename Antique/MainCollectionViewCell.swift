//
//  MainCollectionViewCell.swift
//  Antique
//
//  Created by user on 2020/08/12.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import FirebaseUI
class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ImgeView: UIImageView!
    // PostDataの内容をセルに表示
          func setPostData(_ postData: PostData) {
              // 画像の表示
              ImgeView.sd_imageIndicator = SDWebImageActivityIndicator.gray
              let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
              ImgeView.sd_setImage(with: imageRef)

           
        }
}
