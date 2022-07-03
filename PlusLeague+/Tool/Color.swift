//
//  Color.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/14.
//

import UIKit



extension UIColor{
    
    static func getMainColor()->UIColor{
        
        return UIColor(red: 181/255, green: 153/255, blue: 114/255, alpha: 1)
    }
    
    static func getTeamColor(_ teamColor:String)->UIColor{
        
        let teamColors = teamColor.components(separatedBy: ",")
        let red = CGFloat(Int(teamColors[0]) ?? 0) / 255
        let green = CGFloat(Int(teamColors[1]) ?? 0) / 255
        let blue = CGFloat(Int(teamColors[2]) ?? 0) / 255
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1)
    }
    
}
