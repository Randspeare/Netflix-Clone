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

class APICaller {
    static let shared = APICaller()
    
    func getTredingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
