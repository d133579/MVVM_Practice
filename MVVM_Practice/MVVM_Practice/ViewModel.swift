//
//  ViewModel.swift
//  MVVM_Practice
//
//  Created by 文 on 2018/2/19.
//  Copyright © 2018年 文. All rights reserved.
//

import Foundation

struct ViewModel:CellPresentable {
    var siteName = ""
    var address = ""
    var avaliableBikeCount = 0
    var avaliableSpaceCount = 0
    var updateTime = Date()
    
    init(model:TBikeSite) {
        self.siteName = model.StationName!
        self.address = model.Address!
        self.avaliableBikeCount = model.AvaliableBikeCount!
        self.avaliableSpaceCount = model.AvaliableSpaceCount!
//        self.updateTime = model.UpdateTime
    }
}
