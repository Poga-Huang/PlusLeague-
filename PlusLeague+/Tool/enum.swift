//
//  enum.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import Foundation

enum Teams:String,CaseIterable{
    case Braves = "台北富邦勇士"
    case Kings = "新北國王"
    case Pilot = "新竹街口攻城獅"
    case Lioneers = "桃園領航猿"
    case Dreamers = "福爾摩沙台新夢想家"
    case Steelers = "高雄鋼鐵人"
    
    var apiID:String{
        switch self {
        case .Braves:
            return "tblAggTYuBM0pQqlX"
        case .Kings:
            return "tbl9lAqaIgfqUfhLe"
        case .Pilot:
            return "tblf2PXj51YrTu4jo"
        case .Lioneers:
            return "tblUyUe80H84A7oY6"
        case .Dreamers:
            return "tblqaTXHuseJFH0n3"
        case .Steelers:
            return "tbloC0PdICViPc7fa"
        }
        
    }
}
