//
//  MassageViewController.swift
//  Antique
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import MessageUI
class MassageViewController: UIViewController,MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func mailButton(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
                  let mail = MFMailComposeViewController()
                  mail.setToRecipients(["test@gmail.com"])
                  mail.setSubject("ご意見")
                  mail.setMessageBody("", isHTML: false)
                  mail.mailComposeDelegate = self
                  self.navigationController?.present(mail, animated: true, completion: nil)
              } else {
                  let alert = UIAlertController(title: "No Mail Accounts", message: "Please set up mail accounts", preferredStyle: .alert)
                  let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                  alert.addAction(dismiss)
                  self.present(alert, animated: true, completion: nil)
              }
    }
    @IBAction func chanselButton(_ sender: Any) {
        // 画面を閉じる
              self.dismiss(animated: true, completion: nil)
    }
    
  
   
 
  

}
