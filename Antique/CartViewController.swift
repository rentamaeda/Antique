//
//  CartViewController.swift
//  Antique
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    var images = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]

    //値段の配列
    var prices = ["¥7800","¥23,000","¥36,000","¥4500","¥9650","¥6700","¥7500","¥9800","¥29,000","¥10,600","¥11,000","¥3120","¥1350","¥14,900","¥32,000"]

    //ブランド名の配列
    var brands = ["Patagonia","A BATHING APE","nano・universe","green label relaxing","antiqua","Tommorowland","Felissimo","Aula","Bal","Fred Perry","Grandier","HUGO","Jackman","KBF","Lazar"]
       var selectedImg: UIImage!

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image = selectedImg

    }
    
    @IBAction func buyButton(_ sender: Any) {
    }
    
    @IBAction func chanselButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
}
