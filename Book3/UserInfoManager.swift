//
//  UserInfoManager.swift
//  Book3
//
//  Created by ktds 10 on 14/05/2019.
//  Copyright © 2019 kt ds. All rights reserved.
//

import Foundation

struct UserInfoKey {
    static let id = "LOGINID"
    static let username = "USERNAME"
    static let name = "NAME"
    static let token = "TOKEN"
    static let profile = "PROFILE"
}

class UserInfoManager {
    
    var id:String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.id)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.id)
            ud.synchronize()
        }
    }
    var token:String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.token)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.token)
            ud.synchronize()
        }
    }
    var username:String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.username)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.username)
            ud.synchronize()
        }
    }
    var name:String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
}
