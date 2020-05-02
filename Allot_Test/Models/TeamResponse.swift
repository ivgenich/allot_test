//
//  TeamResponse.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation

class TeamResponse: Decodable{
     let teams: [Team]

    enum CodingKeys: String, CodingKey{
        case teams = "teams"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.teams = try container.decode([Team].self, forKey: .teams)
    }
}
