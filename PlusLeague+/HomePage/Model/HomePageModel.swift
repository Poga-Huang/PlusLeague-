//
//  Model.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/4.
//

import Foundation

struct HomePageModel:Decodable{
    var records:[Records]
    struct Records:Decodable{
        var fields:Fields
        struct Fields:Decodable{
            var name:String
            var item:String
            var coverImage:[CoverImage]?
            struct CoverImage:Decodable{
                var url:URL
            }
        }
    }
    //Get JSON Data
    static func pleagueDataHandler(data:Data)->HomePageModel?{
        do{
            let result = try JSONDecoder().decode(HomePageModel.self, from: data)
            
            return result
        }
        catch{
            return nil
        }
    }
    
}
