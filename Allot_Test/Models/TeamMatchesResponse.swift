//
//  TeamMatchesResponse.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation

class TeamMatchesResponse: Decodable{
    
    let matches: [Match]
    let count:Int
    
    enum CodingKeys: String, CodingKey{
        case matches = "matches"
        case count = "count"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.matches = try container.decode([Match].self, forKey: .matches)
    }
}
