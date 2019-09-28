//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import RxSwift

class BaseInteractor {

    var disposeBag = DisposeBag()
//    let errorDecoder = ErrorDecoder()

    /**
    Выполняет отписку от всех событий, соответсвенно - их завершение
    */
    func disposeAllSubscription() {
        disposeBag = DisposeBag()
    }
//
//    func generateUIMessage(from error: Error) -> String{
//        let errorDecoder = ErrorDecoder()
//        return errorDecoder.getUserFriendlyMessage(from: error)
//    }

}
