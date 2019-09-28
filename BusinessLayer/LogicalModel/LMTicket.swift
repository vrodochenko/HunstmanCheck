//
//  LMTicket.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class LMTicket: LMBusinessModel {
    let fio, serNum: String
    let finishOfTour, startOfTour, dayOfBirth: Date

    init(fio: String, serNum: String, finishOfTour: Date, startOfTour: Date, dayOfBirth: Date) {
        self.fio = fio
        self.serNum = serNum
        self.finishOfTour = finishOfTour
        self.startOfTour = startOfTour
        self.dayOfBirth = dayOfBirth
    }

    func generateHash() -> String {

        // Формируем колбаску из следующих переменных
        let colbosa = """
                      \(fio)\(serNum)
                      \(finishOfTour.toString(.RUSSIAN_DATE))
                      \(startOfTour.toString(.RUSSIAN_DATE))
                      \(dayOfBirth.toString(.RUSSIAN_DATE))
                      """
        // Чистим колбаску от пробелов
        let clearColbosa = String(colbosa.filter {
            !" \n\t\r".contains($0)
        })

        // Получаем sha256
        let md5 = MD5(string: clearColbosa)

        let md5Hex = md5.map {
            String(format: "%02hhx", $0)
        }.joined()

//
//        let md5Base64 = md5.base64EncodedString()

        return md5Hex
    }
}
