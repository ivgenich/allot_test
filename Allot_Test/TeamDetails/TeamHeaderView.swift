//
//  TeamHeaderView.swift
//  Allot_Test
//
//  Created by Chertok on 02/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import UIKit

class TeamHeaderView: UIView {
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    
    public func bind(name: String?, imageUrl: String?) {
        
        teamImg.image = nil
        if let imageUrl = imageUrl{
            teamImg.loadImageFromURL(URL(string: imageUrl), placeHolderImage: UIImage(named: "default_image")) {
                [weak self]
                _ in
                self?.teamImg.contentMode = .scaleAspectFit
            }
        }
        teamName.text = name
        
    }

}
