//
//  SloganCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

class SloganCell: UITableViewCell {
    
    
    @IBOutlet weak var sloganImageView: UIImageView!
    
    var imageURL:URL?
    
    func getImage(url:URL){
        DownloadHelper.shared.downloadImage(URL: url) { result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                    self.sloganImageView.image = UIImage(data: data)
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
