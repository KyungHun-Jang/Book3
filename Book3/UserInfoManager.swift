//
//  UserInfoManager.swift
//  Book3
//
//  Created by ktds 10 on 14/05/2019.
//  Copyright © 2019 kt ds. All rights reserved.
//

import Foundation

import Alamofire

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
    
    var isLogin:Bool {
        if self.id == nil || self.username == nil {
            return false
        }
        else {
            return true
        }
    }
    
    //Login
    func login(username:String, password:String, success:(()->Void)? = nil, fail:((String)->Void)? = nil){
        
        //1.URL과 전송할 값 준비
        let url = "http://localhost:3000/auth/login"
        let param: Parameters = [
            "username":username,
            "password":password
        ]
        
        //2.서버에 요청
        let call = AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default)
        
        call.responseJSON{
            res in
            switch res.result {
            case .success(let data):
                if let response = data as? NSDictionary {
                    if let successResult = response["success"] as? Bool,
                        successResult == true {
                        if let data = response["data"] as? NSDictionary {
                            self.id = data["_id"] as? String
                            self.username = data["username"] as? String
                            self.name = data["name"] as? String
                            self.token = data["token"] as? String
                            
                            success?()
                        }
                    }
                }
            case .failure(let error):
                    fail?("오류발생: \(error)")
            }
        }
    }
    
    func logout() -> Bool {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.id)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.username)
        ud.removeObject(forKey: UserInfoKey.token)
        ud.synchronize()
        return true
    }
}
