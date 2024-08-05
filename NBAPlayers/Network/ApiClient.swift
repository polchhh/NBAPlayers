//
//  ApiClient.swift
//  NBAPlayers
//
//  Created by Полина Голодаевская on 23.07.2024.
//

import Foundation

enum ApiError: Error {
    case noData
}

protocol ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> Void)
}


class ApiClientImp: ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "https://api.balldontlie.io/v1/players")!
        var urlRequest = URLRequest(url: url)
        let apiKey = secretApiKey
        urlRequest.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {
            data, response, error in
            
            sleep(5)
            
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(PlayersResponse.self, from: data)
                completion(.success(response.data))
            } catch (let error) {
                completion(.failure(error))
            }
        })
        
        dataTask.resume()
    }
}
