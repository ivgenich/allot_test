//
//  PlayerCollectionViewCell.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import UIKit
class PlayerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    static let cellSize = CGSize(width: 150, height: 130)
    
    func bind(player: Player?) {
        
        guard let player = player else{
            return
        }
        self.playerNameLbl.text = player.name
        self.playerImage.image = UIImage(named: "default_image")
    }
}
