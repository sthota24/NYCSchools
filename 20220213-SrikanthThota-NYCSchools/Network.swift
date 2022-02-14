//
//  Network.swift
//  20220213-SrikanthThota-NYCSchools
//
//  Created by Srikanth on 2/13/22.
//

import Foundation

struct Network {
    func getData<T: Codable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                // print(data)
                completion(.failure(.requestFailed))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(.unknown))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case badURL,
         requestFailed,
         unknown
    
    func stringValue() -> String {
        switch self {
        case .badURL:
            return "Bad URL"
        case .requestFailed:
            return "Request Failed"
        case .unknown:
            return "Unknown"
        }
    }
}
