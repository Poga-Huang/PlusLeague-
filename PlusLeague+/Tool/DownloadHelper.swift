//
//  DownloadHelper.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/4.
//

import Foundation

class DownloadHelper{
    
    static let shared = DownloadHelper()

    private let apikey = "keyuuszf5krfcrpdZ"
    
    func download(URL:URL,completion:@escaping (Result<Data,Error>)->()){
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data,_,error in
            if let data = data {
                completion(.success(data))
            }
            else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func downloadImage(URL:URL,completion:@escaping (Result<Data,Error>)->()){
        URLSession.shared.dataTask(with: URL) { data, _, error in
            if let data = data {
                completion(.success(data))
            }else if let error = error{
                completion(.failure(error))
            }
        }.resume()
    }
    
}
