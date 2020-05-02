//
//  TeamDetailsResponse.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation


class TeamDetailsResponse: Decodable{
    
    let players: [Player]?
    
    enum CodingKeys: String, CodingKey{
        case squad = "squad"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.players = try container.decodeIfPresent([Player].self, forKey: .squad)
    }
}
