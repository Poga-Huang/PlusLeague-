//
//  LineupModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/3.
//

import Foundation

struct LineupModel:Decodable{
    var records:[Records]
    struct Records:Decodable{
        var fields:Fields
        struct Fields:Decodable{
            var index:Int
            var Name:String
            var EnglishName:String
            var BackNumber:String
            var Birthday:String
            var Height:String
            var Weight:String
            var Position:String
            var Headshot:[Headshot]
            struct Headshot:Decodable{
                var url:URL
            }
            var PlayerNumber:String
        }
    }
    //Get JSON Data
    static func LineupDataHandler(data:Data)->LineupModel?{
        do{
            let result = try JSONDecoder().decode(LineupModel.self, from: data)
            
            return result
        }
        catch{
            return nil
        }
    }
    
}
