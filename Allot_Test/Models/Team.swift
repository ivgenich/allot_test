//
//  Team.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation

class Team: CommonModel{
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey{
        case imageUrl = "crestUrl"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}


