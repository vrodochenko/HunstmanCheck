//
// Created by A on 2019-02-11.
// Copyright (c) 2019 Electronical medicine. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    
    func configure(data: DataType)
}
