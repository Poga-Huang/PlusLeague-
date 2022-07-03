//
//  LineupViewModel.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/3.
//

import Foundation

class LineupViewModel{
    
    public var playerCellViewModels = [PlayerCellViewModel]()
    
    var teamID:String = ""{
        didSet{
            sendRequest()
        }
    }
    
    var onRequestEnd:(()->())?
    
    private func sendRequest(){
        let url = "https://api.airtable.com/v0/appgXA8nvPn4CjNbP/\(teamID)?sort[][field]=index"
        guard let url = URL(string: url) else { return }
        
        DownloadHelper.shared.download(URL: url) { [weak self] result in
            switch result{
            case .success(let response):
                if let lineupResponse = LineupModel.LineupDataHandler(data: response){
                    self?.convertToPlayerCellViewModel(model: lineupResponse)
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
    private func convertToPlayerCellViewModel(model:LineupModel){
        
        let records = model.records
        
        records.forEach { record in
            playerCellViewModels.append(PlayerCellViewModel(record: record))
        }
        
        onRequestEnd?()
    }
    
}
