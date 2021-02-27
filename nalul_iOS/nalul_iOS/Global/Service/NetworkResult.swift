//
//  NetworkResult.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/21.
//  Edited by 김민희 on 2021/02/27.

import Foundation

enum NetworkResult<T> {
    case success(T)
    case failure(Int)
}

