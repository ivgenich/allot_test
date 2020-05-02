//
//  Match.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation


class Match: Decodable{
    
    var competition: Competition
    var homeTeam: Team
    var awayTeam: Team
    var date: String
    
    enum CodingKeys: String, CodingKey{
        case competition = "competition"
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
        case utcDate = "utcDate"
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.competition = try container.decode(Competition.self, forKey: .competition)
        self.homeTeam = try container.decode(Team.self, forKey: .homeTeam)
        self.awayTeam = try container.decode(Team.self, forKey: .awayTeam)
        self.date = try container.decode(String.self, forKey: .utcDate)
    }
}
