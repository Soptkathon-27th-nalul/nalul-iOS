//
//  PostService.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import Foundation
import Alamofire

struct PostService {
    static let shared = PostService()
    
    func getQuestion(classId: Int, completion: @escaping (NetworkResult<Any>)->Void) {
        let url = APIConstants.questionURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json", "accessToken" : UserDefaults.standard.string(forKey: "accessToken") ?? " "]
        
        let dataRequest = AF.request(url + "\(classId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        dataRequest.responseData { response in switch response.result {
        case .success(_):
            if let value = response.value {
                if let status = response.response?.statusCode {
                    switch status {
                    case 200:
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(QuestionData<QuestionSuccess>.self, from: value)
                            completion(.success(result))
                        } catch {
                            completion(.pathErr)
                        }
                    default:break
                    }
                }
            }
        case .failure(_):
            completion(.networkFail)
        }
        
        }
        
    }
    
}
