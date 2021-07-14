//
//  LoginService.swift
//  Journey
//
//  Created by 김승찬 on 2021/07/13.
//

import Foundation
import Moya

enum LoginService {
    
    case postSignIn(email: String, password: String)
    
}

extension LoginService: TargetType {
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .postSignIn(_, _):
            return Const.URL.signInURL
//                + "/\(email)/\(password)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postSignIn(_, _) :
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .postSignIn(let email, let password):
            return .requestParameters(parameters: [
                "userId": email,
                "userPw": password,
                "userToken": "fcm token"
            ], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Conten-Type": "application/json"
        ]
    }
    
}
