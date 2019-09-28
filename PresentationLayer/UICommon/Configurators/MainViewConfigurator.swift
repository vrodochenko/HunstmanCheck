//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import UIKit

class MainViewConfigurator {

    func build() -> UIViewController {
        let storyboard: UIStoryboard = ApplicationDependency.diContainer
                .resolve(name: StoryboardScene.Main.storyboardName)

        let rootViewController = storyboard.instantiateInitialViewController()!
        return rootViewController
    }
}
