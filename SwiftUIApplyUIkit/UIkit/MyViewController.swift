//
//  MyViewController.swift
//  SwiftUIApplyUIkit
//
//  Created by 阿騰 on 2021/1/22.
//

import UIKit

class MyViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var sendLabel: UITextField!
    @IBAction func sendButton(_ sender: Any) {
        Observer.createObsever().update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendLabel.delegate = self
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
extension MyViewController:UITextFieldDelegate{
    //讓鍵盤按下 return 時縮回
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
    }
}
