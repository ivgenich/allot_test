//
//  ViewController.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.sharedInstance.getTeams { [weak self] (teams) in
          print(teams)
        }
        // Do any additional setup after loading the view.
    }


}

