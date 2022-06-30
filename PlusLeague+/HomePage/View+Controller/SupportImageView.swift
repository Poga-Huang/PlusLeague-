//
//  SupportImageView.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/30.
//

import UIKit

class SupportImageView: UIImageView {

    var viewModel:SupportImageViewMdoel?
    
    func setupImage(viewModel:SupportImageViewMdoel){
        self.viewModel = viewModel
        viewModel.downloadImageEnd = {[weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        viewModel.getImage()
    }

}
