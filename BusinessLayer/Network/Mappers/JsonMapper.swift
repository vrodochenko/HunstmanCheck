//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class JsonMapper: JsonMapperProtocol {

    private let decoder = JSONDecoder()

    init() {
        decoder.dateDecodingStrategy = .custom(dateDecodeStrategy)
    }

    func map<T>(_ type: T.Type, from jsonData: Data) -> T? where T: Decodable {
        do {
            return try decoder.decode(type, from: jsonData)
        } catch (let e) {
            debugPrint(e)
            return nil
        }
    }

    func map<T>(_ request: T) -> [String: Any]? where T: Encodable {
        do {
            let data = try JSONEncoder().encode(request)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            return json
        } catch (let e) {
            debugPrint(e)
            return nil
        }
    }

    private func dateDecodeStrategy(decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let dateStr = try container.decode(String.self)

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")

        if let date = dateFormatter.date(from: dateStr, by: .FULL) {
            return date
        } else if let date = dateFormatter.date(from: dateStr, by: .ISO6801) {
            return date
        } else if let date = dateFormatter.date(from: dateStr, by: .ISO8601) {
            return date
        } else if let date = dateFormatter.date(from: dateStr, by: .ISO6800) {
            return date
        } else if let date = dateFormatter.date(from: dateStr, by: .ONLY_DATE) {
            return date
        } else if let date = dateFormatter.date(from: dateStr, by: .AUTH_FORMAT) {
            return date
        } else if let date = dateFormatter.date(from: dateStr, by: .RUSSIAN_DATE) {
            return date
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Can't decode date from string: \(dateStr)")
        }
    }
}
