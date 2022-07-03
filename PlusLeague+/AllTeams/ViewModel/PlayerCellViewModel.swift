//
//  PlayerCellViewModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/3.
//

import UIKit

class PlayerCellViewModel{
    
    var record:LineupModel.Records
    
    init(record:LineupModel.Records){
        self.record = record
    }
    
    var downloadImageEnd:((UIImage?)->())?
    
    func getImage(){
        
        let url = record.fields.Headshot[0].url
        
        DownloadHelper.shared.downloadImage(URL:url) {[weak self] result in
            switch result{
            case .success(let data):
                
                let image = UIImage(data: data)
                self?.downloadImageEnd?(image)
                
            case .failure(_):
                print("Error")
            }
        }
    }
}
