//
//  LoginData.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import Foundation

struct LoginData<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}

struct LoginSuccess: Codable {
    let accessToken: String
    let recent9Pictures: [String]
}
