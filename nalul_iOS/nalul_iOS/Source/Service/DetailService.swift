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
    
    func getDetails() { //params로 부위 넣자
        let url = APIConstants.detailURL
        let header:HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { (response) in
            switch(response.result) {
            case .success:
                print("success")
            case .failure:
                print("fail")
            }
        }
    }
    
//    private func judgeDetailData(status: Int, data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        
//        guard let decodedData = try? decoder.decode(NetworkResult<Any>.self, from: data) else {return .pathErr}
//        
//        switch status {
//        case 200:
//            return .success(decodedData.data)
//        case 400:
//            return .requestErr(decodedData.message)
//        case 500:
//            return .serverErr
//        default:
//            return .networkFail
//        }
//    }
}
