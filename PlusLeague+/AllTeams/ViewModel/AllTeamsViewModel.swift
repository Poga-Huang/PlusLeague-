//
//  AllTeamsViewModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/1.
//

import Foundation

class AllTeamsViewModel{
    
    public var teamViewCellViewModels = [TeamViewCellViewModel]()
    
    public var url:String = ""{
        didSet{
            sendRequest()
        }
    }
    
    var onRequestEnd:(()->())?
    
    private func sendRequest(){
        guard let url = URL(string: url) else { return }
        
        DownloadHelper.shared.download(URL: url) { [weak self] result in
            switch result{
            case .success(let response):
                if let allTeamsResponse = AllTeamsModel.AllTeamsDataHandler(data: response){
                    self?.convertToTeamViewCellViewModel(model: allTeamsResponse)
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
    private func convertToTeamViewCellViewModel(model:AllTeamsModel){
        
        let records = model.records
        
        records.forEach { record in
            teamViewCellViewModels.append(TeamViewCellViewModel(data: record))
        }
        
        onRequestEnd?()
    }
    
}
