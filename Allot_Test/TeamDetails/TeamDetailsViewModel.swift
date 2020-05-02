//
//  TeamDetailsViewModel.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation
import RxCocoa


struct TeamDetailsViewModel {
    
    let team: Team
    let upcomingMatches: BehaviorRelay<[Match]> = BehaviorRelay(value: [])
    let teamPlayer: BehaviorRelay<[Player]> = BehaviorRelay(value: [])

    
    init(team: Team) {
        self.team = team

    }
    
    public func getData(){
        getTeamDetails()
        getUpcomingMatches()
    }
    
    func getUpcomingMatches(){
        
        NetworkManager.sharedInstance.getUpcomingMatches(teamId: team.id, completionHandler: {(matches) in
            self.upcomingMatches.accept(matches)
        })
    }
    
    func getTeamDetails(){
        NetworkManager.sharedInstance.getTeamDetails(teamId: team.id, completionHandler: {(details) in
            guard let players = details.players else{
                return
            }
            if players.isEmpty{
                let jsonData = PlayerJson.playerJson.data(using: .utf8)!
                let players = try! JSONDecoder().decode([Player].self, from: jsonData)
                self.teamPlayer.accept(players)
                return
            }
            self.teamPlayer.accept(players)
        })
    }
    
    public func getTeam() -> Team?{
        return team
    }
}
