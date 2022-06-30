//
//  HomePageViewModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import Foundation

class HomePageViewModel{
    
    public var listCellViewModels = [HomeListCellViewModel]()
    public var coverImageViewModels = [CoverImageViewModel]()
    public var seasonCoverImageViewModel:SeasonCoverImageViewModel?
    public var supportImageViewModel:SupportImageViewMdoel?
    
    public var url:String = ""{
        didSet{
            sendRequest()
        }
    }
    
    var onRequestEnd:(()->())?
    
    private func sendRequest(){
        guard let apiUrl = URL(string: url) else { return }
        DownloadHelper.shared.download(URL: apiUrl) {[weak self] result in
            switch result{
            case .success(let response):
                if let model = HomePageModel.pleagueDataHandler(data: response){
                    self?.convertToHomePageData(model: model)
                }
            case .failure(_):
                print("Network Error")
            }
        }
    }
    
    private func convertToHomePageData(model:HomePageModel){
        
        for (index,record) in model.records.enumerated(){
            //封面照片
            if index == 0{
                if let coverImages = record.fields.coverImage{
                    coverImages.forEach { coverImage in
                        coverImageViewModels.append(CoverImageViewModel(url: coverImage.url))
                    }
                }
            }
            //賽季主題
            else if index == 1{
                if let coverImages = record.fields.coverImage{
                    coverImages.forEach { coverImage in
                        seasonCoverImageViewModel = SeasonCoverImageViewModel(url: coverImage.url)
                    }
                }
            }
            //贊助商
            else if index == 2{
                if let coverImages = record.fields.coverImage{
                    coverImages.forEach { coverImage in
                        supportImageViewModel = SupportImageViewMdoel(url: coverImage.url)
                    }
                }
            }
            else{
                //其他URL
                let fields = record.fields
                    
                guard let url = URL(string:fields.item) else { return }
                    
                listCellViewModels.append(HomeListCellViewModel(name: fields.name, url: url))
            }
        }
        onRequestEnd?()
    }

}
