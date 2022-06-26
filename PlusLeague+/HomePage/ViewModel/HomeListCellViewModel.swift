//
//  HomeListCellViewModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import Foundation

class HomeListCellViewModel{
    
    var itemName:String
    var itemURL:URL
    
    init(name:String,url:URL){
        self.itemName = name
        self.itemURL = url
        
    }
    
}
