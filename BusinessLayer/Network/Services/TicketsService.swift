//
// Created by Арабаджиян Артем on 2019-09-29.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

protocol TicketsApi {
    func uploadBlk(content: UploadBlkData) -> Completable
}


class TicketsService: BaseRemoteService, TicketsApi {

    func uploadBlk(content: UploadBlkData) -> Completable {
        return data(.post,
                URL_API + "updatebl",
                parameters: mapper.map(content),
                encoding: JSONEncoding.default)
    }
}
