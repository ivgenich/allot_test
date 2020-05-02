//
//  GameCollectionViewCell.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import UIKit

class MatchCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var teamsLbl: UILabel!
    @IBOutlet weak var matchDateLbl: UILabel!
    @IBOutlet weak var competitionTypeLbl: UILabel!
    
    static let cellSize = CGSize(width: 300, height: 120)
    
    func bind(match: Match?) {
        
        guard let match = match else{
            return
        }
        
        teamsLbl.text = "\(match.homeTeam.name) vs \(match.awayTeam.name)"
        matchDateLbl.text = Utils.convertDateFormat(inputDate: match.date) 
        competitionTypeLbl.text = match.competition.name
    }
}
