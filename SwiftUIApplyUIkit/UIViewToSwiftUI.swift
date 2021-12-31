//
//  UIViewToSwiftUI.swift
//  SwiftUIApplyUIkit
//
//  Created by 阿騰 on 2021/12/31.
//

import SwiftUI

struct UITableViewToSwiftUI:UIViewRepresentable{
    //將TableView轉換成SwiftUI
    typealias UIViewType = UITableView //設定要轉換的 UIView 類型
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView() //新增一個 UITableView
        tableView.dataSource = context.coordinator //設定 dataSource
        tableView.delegate = context.coordinator //設定 delegate
        /*
         會使用 context.coordinator 是為了抓取在 makeCoordinator 所 new 的 Class
         */
        
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        //資料更新時呼叫的地方 uiView.reloadData() 之類的
    }
    
    func makeCoordinator() -> TableCoordinator {
        //這裡預設的回傳為 func makeCoordinator() -> Self.Coordinator
        //然而 Self.Coordinator 為 associatedtype Coordinator = Void
        //associatedtype 有點像是 泛型<T>
        //(但實際上不一樣，只是使用的場景概念很像，都是允許各式class型態、並且系統會猜用的是什麼)
        return TableCoordinator() //將下面實作 UITableViewDataSource 與 UITableViewDelegate 的 class 回傳
    }
    class TableCoordinator:NSObject,UITableViewDataSource,UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //有幾行 row
            return 5
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()// 建立 UITableViewCell
            var content = cell.defaultContentConfiguration() //取得預設的設定檔
            // Configure content.
            content.image = UIImage(systemName: "star") //將設定檔的cell圖片設定為星星
            content.text = "Favorites" // 將設定檔的cell文字設定為 "Favorites"
            // Customize appearance.
            content.imageProperties.tintColor = .purple //設定星星為紫色
            cell.contentConfiguration = content //將 cell 的設定檔換成剛剛設定的
            return cell//回傳 Cell
        }
    }
}
