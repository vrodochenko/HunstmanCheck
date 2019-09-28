//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import DITranquillity

/**
 При добавлении новго модуля или сториборда, их нужно прописать в данном фреймверке
*/
class PresentationFramework: DIFramework {
    static func load(container: DIContainer) {

        // Views
        container
                .append(framework: ScanFramework.self)
                .append(framework: TicketFramework.self)
                .append(framework: HistoryFramework.self)
                .append(framework: BlockFramework.self)


        //Storyboards
        container.registerStoryboard(name: StoryboardScene.Main.storyboardName)
    }
}
