//
//  DetailService.swift
//  nalul_iOS
//
//  Created by inae Lee on 2020/11/22.
//

import Foundation
import Alamofire

struct DetailService {
    static let shared = DetailService()
    
    func getDetails(completion: @escaping ((NetworkResult<Any>) -> (Void))) { //params로 부위 넣자
        let url = APIConstants.detailURL
        let header:HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { (response) in
            switch(response.result) {
            case .success:
                print("success")
                guard let statusCode = response.response?.statusCode else {return}
                guard let data = response.value else {return}
                
                completion(judgeDetailData(status: statusCode, data: data))
            case .failure:
                print("fail")
                completion(.networkFail)
            }
        }
    }
    
    private func judgeDetailData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(DetailResponse.self, from: data) else {return .pathErr}
        
        switch status {
        case 200:
            return .success(decodedData)
        case 400:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
