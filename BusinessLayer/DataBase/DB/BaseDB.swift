//
//  TicketsDB.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import CoreData

class BaseDB<CDM: NSManagedObject, EMM: LMBusinessModel> {
    
    var entityName: String {
        return String(describing: CDM.self)
    }
    let context: NSManagedObjectContext
    let adapter: BaseDaoAdapter<CDM, EMM>
    
    init(witContext context: CoreDataProtocol, adapter: BaseDaoAdapter<CDM, EMM>) {
        self.context = context.backgroundContext
        self.adapter = adapter
    }
    
    func getAll() -> [EMM] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        do {
            let items = try self.context.fetch(request) as! [CDM]
            let emmProfiles = items.map {
                self.adapter.map(from: $0)
            }
            return emmProfiles
        } catch {
            print("Failed to fetch employees: \(error)")
            return [EMM]()
        }
    }
    
    func removeAll() {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch (let error) {
            print("Failed to remove employees: \(error)")
        }
    }
    
    func insertAll(items: [EMM]) {
        items.forEach {
            adapter.map(from: $0, to: CDM(context: context))
        }
        do {
            try context.save()
        } catch (let error) {
            print("Failed to insert employees: \(error)")
        }
    }
}