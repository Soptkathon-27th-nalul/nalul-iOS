//
//  APIConstants.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/21.
//

import Foundation
struct APIConstants {
    static let baseURL = "http://13.124.67.93:3000"
    
    //uuid 체크인 url
    static let loginURL = APIConstants.baseURL + "/users"
    
    // 메인 사진 9개 받아오는 url
    static let mainURL = APIConstants.baseURL + ""
    
    // 디테일 사진 받아오는 url
    static let detailURL = APIConstants.baseURL + ""
    
    // 글 작성 url
    static let writeURL = APIConstants.baseURL + "/posts"
    
    // 질문 받기 url
    static let questionURL = APIConstants.baseURL + "/posts/"
    
    
}
