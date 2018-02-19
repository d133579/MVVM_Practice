//
//  Model.swift
//  MVVM_Practice
//
//  Created by 文 on 2018/2/11.
//  Copyright © 2018年 文. All rights reserved.
//

import UIKit

protocol CellPresentable {
    var siteName:String {get set}
    var avaliableBikeCount:Int {get set}
    var avaliableSpaceCount:Int {get set}
    var updateTime:Date {get set}
    var address:String {get set}
    func updateCell(cell:SiteTableViewCell)
}
extension CellPresentable {
    func updateCell(cell:SiteTableViewCell) {
        cell.siteLabel.text = siteName
        cell.addressLabel.text = address
        cell.avaliableBikeLabel.text = String(avaliableBikeCount)
        cell.avaliableSpaceLabel.text = String(avaliableSpaceCount)
    }
}

struct TBikeSite: Codable {
    var Id:Int?
    var StationName:String?
    var Address:String?
    var EnglishStationName:String?
    var EnglishAddress:String?
    var Capacity:Int?
    var AvaliableBikeCount:Int?
    var AvaliableSpaceCount:Int?
//    var UpdateTime:Date
    var Latitude:Double?
    var Longitude:Double?
}
