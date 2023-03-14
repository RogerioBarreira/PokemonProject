//
//  RequestGenerics.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import Foundation

enum Method: String {
    case get = "GET"
}

class RequestGenerics: NSObject {
    
    func requestGenerics<T: Codable>(urlString: String, method: Method, custom: T.Type, completion: @escaping(T?,Bool)-> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Erro na URL \(urlString)")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            if error == nil {
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let objeto = try JSONDecoder().decode(custom.self, from: data)
                        DispatchQueue.main.async {
                            completion(objeto,true)
                        }
                    } catch {
                        print("Erro de JsonDecoder")
                        completion(nil,false)
                    }
                } else {
                    print("Erro statusCode = \(response.statusCode)")
                    completion(nil,false)
                }
            } else {
                print("Error = \(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
    }
}
