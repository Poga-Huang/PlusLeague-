//
//  Enum.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/4.
//

import Foundation


enum ApiType{
    case pleague
    case allTeams
}

extension ApiType{
    var baseURL:String{
        get{
            var base:String
            var id:String
            switch self{
            case .pleague:
                id = "tblvxuXcUuNvoEhIc"
                base = "https://api.airtable.com/v0/appgXA8nvPn4CjNbP/\(id)"
            case .allTeams:
                id = "tblBHRH5PaJUO8ST3"
                base = "https://api.airtable.com/v0/appgXA8nvPn4CjNbP/\(id)?sort[][field]=Name"
            }
            return base
        }
    }
}

enum HomePageListType:String,CaseIterable{
    case record = "賽事紀錄"
    case about = "關於聯盟"
    case socialMedia = "聯盟社群"
}
