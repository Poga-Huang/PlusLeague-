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
    
    static func getTeamColor(_ team:Teams)->UIColor{
        
        switch team {
        case .Braves:
            return UIColor(red: 40/255, green: 142/255, blue: 199/255, alpha: 1)
        case .Kings:
            return UIColor(red: 252/255, green: 230/255, blue: 0/255, alpha: 1)
        case .Pilot:
            return UIColor(red: 81/255, green: 22/255, blue: 127/255, alpha: 1)
        case .Lioneers:
            return UIColor(red: 234/255, green: 85/255, blue: 3/255, alpha: 1)
        case .Dreamers:
            return UIColor(red: 144/255, green: 181/255, blue: 64/255, alpha: 1)
        case .Steelers:
            return UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        }
    }
    
}
