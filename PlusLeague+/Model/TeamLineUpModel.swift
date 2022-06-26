//
//  TeamLineUpModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/19.
//

import Foundation

struct TeamLineUpModel:Decodable{
    var records:[Records]
    struct Records:Decodable{
        var fields:Fields
        struct Fields:Decodable{
            var Name:String
            var Birthday:String
            var Headshot:[HeadShot]
            struct HeadShot:Decodable{
                var url:URL
            }
            var Height:String
            var Weight:String
            var Position:String
            var BackNumber:String
            var PlayerNumber:String
            var EnglishName:String
            var index:String
        }
    }
    
    static func teamLineUpDataHandler(data:Data)->TeamLineUpModel?{
        do{
            let result = try JSONDecoder().decode(TeamLineUpModel.self, from: data)
            
            return result
        }
        catch{
            return nil
        }
    }
}
