//
//  ContentView.swift
//  SwiftUIApplyUIkit
//
//  Created by 阿騰 on 2021/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var data = ""
    var body: some View {
        VStack {
            TextField("這裡是SwiftUI元件", text: $data)
            UIkitToSwiftUI(data: $data)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
