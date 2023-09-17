//
//  Model.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import Foundation
// MARK: - MenuList
struct MenuList: Codable {
    let status: Bool
    let homeData: [HomeData]
}

// MARK: - HomeData
struct HomeData: Codable {
    let type: String
    let values: [Value]
}

// MARK: - Value
struct Value: Codable {
    let id: Int
    let name: String?
    let image_url, banner_url: String?
    let image: String?
    let actual_price, offer_price: String?
    let offer: Int?
    let is_express: Bool?
}


typealias apiResult<T: Codable> = Result<T, Error>

protocol GetMenuList {
    func dataRequest<T: Codable>(urlRequest: URL, completionHandler: @escaping (apiResult<T>) -> Void)
}

class MenuModel: GetMenuList {
    
    func dataRequest<T: Codable>(urlRequest: URL, completionHandler: @escaping (apiResult<T>) -> Void) where T : Decodable, T : Encodable {
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let responseData = response as? HTTPURLResponse, responseData.statusCode == 200 {
                if let data {
                    do {
                        let encodedData = try JSONDecoder().decode(T.self, from: data)
                        print("API Request: \(urlRequest)")
                        completionHandler(.success(encodedData))
                    } catch {
                        completionHandler(.failure(error))
                    }
                }
            } else {
                if let error = error {
                    completionHandler(.failure(error))
                }
                return
            }
        }.resume()
    }
    
}
