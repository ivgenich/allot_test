//
//  CommonModel.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation



class CommonModel: Decodable{
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }
    
    internal init(id: Int ,name: String) {
        self.id = id
        self.name = name
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
}
