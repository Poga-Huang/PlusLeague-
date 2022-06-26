//
//  coverImageViewModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import UIKit

class CoverImageViewModel{
    
    var downloadURL:URL
    
    init(url:URL){
        self.downloadURL = url
    }

    var downloadImageEnd:((UIImage?)->())?
    
    func getImage(){
        DownloadHelper.shared.downloadImage(URL:downloadURL) {[weak self] result in
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
