//
//  LoginService.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService()
    private func makeLoginParameter(_ uuid: String) -> Parameters {
        return ["uuid": uuid]
    }
    
    func login(uuid: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type" : "multipart/form-data"]
        let dataRequest = AF.request(APIConstants.loginURL, method: .post, parameters: makeLoginParameter(uuid), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in switch dataResponse.result {
        case .success:
            guard let statusCode = dataResponse.response?.statusCode else { return }
            guard let value = dataResponse.value else { return }
            let networkResult = self.judgeSignInData(status: statusCode, data: value)
            completion(networkResult)
        case .failure: completion(.networkFail)
        }
        }
    }
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginData<LoginSuccess>.self, from: data) else {
            return .pathErr
        }
        switch status {
        case 200:
            return .success(decodedData)
        case 204:
            return .success(decodedData)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
