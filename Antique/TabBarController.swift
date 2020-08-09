//
//  TabBarController.swift
//  Antique
//
//  Created by user on 2020/08/04.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
              super.viewDidAppear(animated)

            // currentUserがnilならログインしていない
              if Auth.auth().currentUser == nil {
                  // ログインしていないときの処理
                  let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                  self.present(loginViewController!, animated: true, completion: nil)
              }

 
 }
    
/*    // タブバーのアイコンがタップされた時に呼ばれるdelegateメソッドを処理する。
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is MassageViewController {
            // MassageViewControllerは、タブ切り替えではなくモーダル画面遷移する
            let MassageViewController = storyboard!.instantiateViewController(withIdentifier: "Massage")
            present(MassageViewController, animated: true)
            return false
        } else {
            // その他のViewControllerは通常のタブ切り替えを実施
            return true
        }
    }
*/
}
