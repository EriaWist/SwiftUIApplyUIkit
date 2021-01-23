//
//  Observer.swift
//  SwiftUIApplyUIkit
//
//  Created by 阿騰 on 2021/1/23.
//

class Observer {
    static private var observer:Observer? = nil
    private var updateFunc:(()->())?=nil
    private init() {
    }
    static func createObsever() -> Observer {
        if Observer.observer==nil {
            Observer.observer = Observer()
        }
        return Observer.observer!
    }
    func addUpdate(update:@escaping ()->()) {
        self.updateFunc = update
    }
    func update() {
        (updateFunc ?? {print("Observer nil Error")})()
    }
}
