//
//  TeamViewModel.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation
import RxCocoa

struct TeamViewModel {
    
    let teams: BehaviorRelay<[Team]> = BehaviorRelay(value: [])
    
    init() {
        getTeams()
    }
    
    private func getTeams(){
        NetworkManager.sharedInstance.getTeams {(teams) in
            self.teams.accept(teams)
        }
    }
    
    public func getSelectedTeam(index:Int) -> Team{
        return self.teams.value[index]
    }
}
