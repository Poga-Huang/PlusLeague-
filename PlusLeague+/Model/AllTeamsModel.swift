//
//  AllTeamsModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/18.
//

import Foundation

struct AllTeamsModel:Decodable{
    var records:[Records]
    struct Records:Decodable{
        var fields:Fields
        struct Fields:Decodable{
            var Name:String
            var Location:String
            var EnglishName:String
            var HomeCourt:String
            var TicketLink:URL
            var TeamColor:String
            var HomeCourtAddress:String
            var Core:String
            var Story:String
            var SloganImage:[SloganImage]
            struct SloganImage:Decodable{
                var url:URL
            }
            var HomeCourtLat:Double
            var HomeCourtLong:Double
            var CreateTime:String
            var TeamListID:String
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
