//
//  QuestionData.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import Foundation

struct QuestionData<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}

// MARK: - Datum
struct QuestionSuccess: Codable {
    let questionID: Int
    let questionText: String

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case questionText
    }
}
