//
//  TableViewCell.swift
//  Antique
//
//  Created by user on 2020/08/12.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import FirebaseUI
class TableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }

      // PostDataの内容をセルに表示
      func setPostData(_ postData: PostData) {
        
          //名前の表示
        self.nameLable.text = "\(postData.name!) "

          // 画像の表示
          ImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
          let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
          ImageView.sd_setImage(with: imageRef)

          // キャプションの表示
        self.commentLabel.text = " \(postData.caption!)"

          // 日時の表示
        self.dateLabel.text = "\(postData.date!)"
    }

}
