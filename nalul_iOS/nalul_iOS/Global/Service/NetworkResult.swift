//
//  NetworkResult.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/21.
//

import Foundation
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
