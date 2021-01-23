//
//  UIkitToSwiftUI.swift
//  SwiftUIApplyUIkit
//
//  Created by 阿騰 on 2021/1/22.
//

import Foundation
import SwiftUI
struct UIkitToSwiftUI:UIViewControllerRepresentable {
    @Binding var data:String
    typealias UIViewControllerType = MyViewController
    func makeUIViewController(context: Context) -> MyViewController {
        let myStoryboard = UIStoryboard(name: "MyStoryboard", bundle: nil)
        let myViewController = myStoryboard.instantiateViewController(withIdentifier: "MyView") as! MyViewController
        Observer.createObsever().addUpdate {
            data = myViewController.sendLabel.text ?? "你沒有輸入字"
        }
        return myViewController
    }
    
    func updateUIViewController(_ uiViewController: MyViewController, context: Context) {
        uiViewController.myLabel.text=data
    }
    

}
