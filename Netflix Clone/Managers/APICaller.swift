//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Ana Naomi Erlandez on 3/19/24.
//

import Foundation


struct Constants {
    static let API_KEY = "bd5203769b62e11a360e23fe0ceffedb"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTredingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
//                print(results.results[0].original_title)
            } catch {
                completion(.failure(error))
//                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
