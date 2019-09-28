//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

enum DatePatterns: String{
    case FULL = "yyyy-MM-dd'T'HH:mm:ss"
    case ISO6801 = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    case ISO8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
    case ISO6800 = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    case ONLY_DATE = "yyyy-MM-dd"
    case RUSSIAN_DATE = "dd.MM.yyyy"
    case AUTH_FORMAT = "EEE, dd MMM yyyy HH:mm:ss Z"
    case SHORT_DATE_WEEK = "EEE, dd MMM"
    case ONLY_TIME = "HH:mm"
    case FULL_MONTH = "LLLL"
    case FULL_MONTH_YEAR = "LLLL, yyyy"
    case ONLY_EAR = "yyyy"
    case russianUser = "dd MMM yyyy"
}
