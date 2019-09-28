//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

protocol JsonMapperProtocol {

    func map<T>(_ type: T.Type, from jsonData: Data) -> T? where T: Decodable

    func map<T>(_ request: T) -> [String: Any]? where T: Encodable
}
