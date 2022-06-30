//
//  SeasonCoverImageView.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/30.
//

import UIKit

class SeasonCoverImageView: UIImageView {

    var viewModel:SeasonCoverImageViewModel?
    
    func setupImage(viewModel:SeasonCoverImageViewModel){
        self.viewModel = viewModel
        viewModel.downloadImageEnd = {[weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        viewModel.getImage()
    }
}
