//
//  CoreDataProtocol.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    var backgroundContext: NSManagedObjectContext { get }
}
