//
//  APIManager.swift
//  RxMarvel
//
//  Created by Nicholas Babo on 10/05/18.
//  Copyright © 2018 Nicholas Babo. All rights reserved.
//

import Foundation

class APIManager{
    
    static let publicKey:String = "c14196f29800d394302737f941d6fa78"
    static let privateKey:String = "fe0a1d1c5447967bbc06b1b8a0a8214dae107401"
    static let ts:String = "timestamp"
    
     static let hash:String = "219aafc058701b884b07b3cfbd278f02"
    
    static func getCharacters(){
            // Set up the URL request
        let endpoint:String = "http://gateway.marvel.com/v1/public/characters?ts=\(APIManager.ts)&apikey=\(APIManager.publicKey)&hash=\(APIManager.hash)"
            guard let url = URL(string: endpoint) else {
                print("Error: cannot create URL")
                return
            }
            let urlRequest = URLRequest(url: url)
            
            // set up the session
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            // make the request
            let task = session.dataTask(with: urlRequest) {
                (data, response, error) in
                // check for any errors
                guard error == nil else {
                    print("error calling GET on /todos/1")
                    print(error!)
                    return
                }
                // make sure we got data
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                // parse the result as JSON, since that's what the API provides
                do {
                    guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                        as? [String: Any] else {
                            print("error trying to convert data to JSON")
                            return
                    }
                    // now we have the todo
                    // let's just print it to prove we can access it
//                    print("The todo is: " + todo.description)
                    
                    // the todo object is a dictionary
                    // so we just access the title using the "title" key
                    // so check for a title and print it if we have one
                    guard let todoTitle = todo["data"] as? [String:Any] else {
                        print("Could not get todo data from JSON")
                        return
                    }
                    
                    guard let results = todoTitle["results"] as? [[String:Any]] else {
                        print("Could not get todo frenes from JSON")
                        return
                    }
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: results, options: [])
                    let decoder = JSONDecoder()
                    let characters = try! decoder.decode([Character].self, from: jsonData)
                    
                    for elem in characters{
                        print(elem)
                    }
                } catch  {
                    print("error trying to convert data to JSON")
                    return
                }
            }
            task.resume()
        }
}
