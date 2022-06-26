//
//  CoverImagewCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import UIKit

class CoverImageCell: UICollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    var viewModel:CoverImageViewModel?
    
    func setupItem(viewModel:CoverImageViewModel){
        self.viewModel = viewModel
        
        viewModel.downloadImageEnd = {[weak self] image in
            DispatchQueue.main.async {
                self?.coverImageView.image = image
                self?.loadingActivityView.stopAnimating()
            }
        }
        
        viewModel.getImage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
