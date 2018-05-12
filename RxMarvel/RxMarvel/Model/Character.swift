//
//  Character.swift
//  RxMarvel
//
//  Created by Nicholas Babo on 10/05/18.
//  Copyright © 2018 Nicholas Babo. All rights reserved.
//

import Foundation

class Character:Codable{
    
    var id:Int
    var name:String
    var description:String
    var modified:String
    
    fileprivate var thumbnail:ResourceImage
    var image:String{
        return "\(self.thumbnail.path).\(self.thumbnail.ext)"
    }
    
    init(id:Int, name:String, description:String, modified:String, thumbnail:ResourceImage) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.thumbnail = thumbnail
    }
    
}
