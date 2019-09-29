//
// Created by A on 2019-03-14.
// Copyright (c) 2019 Electronical medicine. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

class BaseRemoteService {
    let URL_API = "http://10.178.195.95:5000/"

    let mapper: JsonMapperProtocol
    let sessionManager = SessionManager()

    let statusCode = 200...400
    let queue = SerialDispatchQueueScheduler(qos: .background)

    let appJsonHeader = ["Accept": "application/json"]
    let formUrlEncodedHeaders = ["Accept": "application/json",
                                 "Content-Type": "application/x-www-form-urlencoded"]

    init(withParser parser: JsonMapperProtocol) {
        self.mapper = parser

//        sessionManager.adapter = handler
//        sessionManager.retrier = handler
    }

//    func data<T: Decodable>(_ method: Alamofire.HTTPMethod,
//                            _ url: URLConvertible,
//                            parameters: [String: Any]? = nil,
//                            encoding: ParameterEncoding = URLEncoding.default,
//                            headers: [String: String]? = nil) -> Single<T> {
//
//        return sessionManager.rx
//                .request(method, url, parameters: parameters, encoding: encoding, headers: headers)
//                .observeOn(queue)
//                .validate(statusCode: statusCode)
//                .responseData()
//                .asSingle()
//                .validateAndDecodeResponse(with: mapper)
//
//    }

    func data(_ method: Alamofire.HTTPMethod,
              _ url: URLConvertible,
              parameters: [String: Any]? = nil,
              encoding: ParameterEncoding = URLEncoding.default,
              headers: [String: String]? = nil) -> Completable {

        return sessionManager.rx
                .request(method, url, parameters: parameters, encoding: encoding, headers: headers)
                .observeOn(queue)
                .validate(statusCode: statusCode)
                .responseString()
                .asSingle()
                .asCompletable()
    }
}
//
//fileprivate extension PrimitiveSequenceType where TraitType == SingleTrait, ElementType == (HTTPURLResponse, Data) {
//    func validateAndDecodeResponse<R: Decodable>(with mapper: JsonMapperProtocol) -> Single<R> {
//        return self.map { response, data -> R in
//            switch response.statusCode {
//            case 200..<300:
//                if let model = mapper.map(R.self, from: data) {
//                    return model
//                } else {
//                    throw GRServiceError.mapError
//                }
//            default:
//                throw GRServiceError.server(statusCode: response.statusCode, body: data)
//            }
//        }
//    }
//}