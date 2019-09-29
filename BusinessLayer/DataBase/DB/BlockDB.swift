//
// Created by Арабаджиян Артем on 2019-09-29.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import CoreData

class BlockDB: BaseDB<CDMBlock, LMBlock>, BlockDao {

    init(witContext context: CoreDataProtocol) {
        super.init(witContext: context, adapter: BlockDaoAdapter())
    }

    func add(block: LMBlock) {
        super.insertAll(items: [block])
    }

    func get(byUserHash userHash: String) -> LMBlock? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        request.predicate = NSPredicate(format: "id = %@", userHash)
        do {
            let items = try self.context.fetch(request) as! [CDMBlock]
            let emmProfiles = items.map {
                self.adapter.map(from: $0)
            }
            return emmProfiles.first
        } catch {
            print("Failed to fetch employees: \(error)")
            return nil
        }
    }
}