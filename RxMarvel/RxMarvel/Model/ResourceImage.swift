//
//  ResourceImage.swift
//  RxMarvel
//
//  Created by Nicholas Babo on 10/05/18.
//  Copyright © 2018 Nicholas Babo. All rights reserved.
//

import Foundation

class ResourceImage:Codable{
    
    var path:String
    var ext:String
    
    enum CodingKeys: String, CodingKey{
        case path
        case ext = "extension"
    }
    
    init(path:String, ext:String){
        self.path = path
        self.ext = ext
    }
    
}
