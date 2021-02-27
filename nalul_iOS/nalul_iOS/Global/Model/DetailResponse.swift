//
//  DetailResponse.swift
//  nalul_iOS
//
//  Created by inae Lee on 2020/11/22.
//

import Foundation

struct DetailResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [DetailData]
}

struct DetailData: Codable {
    let questionText, imgURL, contents: String

    enum CodingKeys: String, CodingKey {
        case questionText
        case imgURL = "imgUrl"
        case contents
    }
}
