//
//  BaseDaoAdapter.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import CoreData

class BaseDaoAdapter<CDM: NSManagedObject, EMM: LMBusinessModel>{
    func map(from emm: EMM, to cdm: CDM){
        fatalError("Не реализован")
    }
    
    func map(from cdm: CDM) -> EMM{
        fatalError("Не реализован")
    }
}

protocol CDMAdapter {
    associatedtype CDM: NSManagedObject
    associatedtype EMM: LMBusinessModel
    
    func emm(from cdm: CDM) -> EMM
    
    func cdm(from emm: EMM, cdm: CDM)
}
