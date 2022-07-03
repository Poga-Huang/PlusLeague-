//
//  AllTeamsModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/1.
//

import Foundation

struct AllTeamsModel:Decodable{
    var records:[Records]
    struct Records:Decodable{
        var fields:Fields
        struct Fields:Decodable{
            var name:String
            var location:String
            var englishName:String
            var homeCourt:String
            var ticketLink:URL
            var homeCourtAddress:String
            var core:String
            var sloganImage:[SloganImage]
            struct SloganImage:Decodable{
                var url:URL
            }
            var homeCourtLat:Double
            var homeCourtLong:Double
            var story:String
            var createTime:String
            var teamStat:URL
            var teamRecord:URL
            var teamColor:String
            var playerListID:String
        }
    }
    //Get JSON Data
    static func AllTeamsDataHandler(data:Data)->AllTeamsModel?{
        do{
            let result = try JSONDecoder().decode(AllTeamsModel.self, from: data)
            
            return result
        }
        catch{
            return nil
        }
    }
    
}
