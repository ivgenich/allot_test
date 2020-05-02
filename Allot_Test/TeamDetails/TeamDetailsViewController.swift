//
//  TeamDetailsViewController.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import UIKit
import RxSwift


class TeamDetailsViewController: UIViewController{
    
    @IBOutlet weak var matchesCollectionView: UICollectionView!
    @IBOutlet weak var playerCollectionView: UICollectionView!
    @IBOutlet weak var teamHeaderView: TeamHeaderView!
    @IBOutlet weak var teamPlayerLbl: UILabel!
    @IBOutlet weak var matchesLbl: UILabel!
    
    var teamDetailsViewModel: TeamDetailsViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPlayersCollection()
        setupMatchesCollection()
        teamDetailsViewModel.getData()
        
        teamPlayerLbl.text = "team_player".localized
        matchesLbl.text = "upcoming_matches".localized
        
    }
    
    private func setupMatchesCollection(){
        matchesCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        teamDetailsViewModel.upcomingMatches.bind(to: matchesCollectionView.rx.items(cellIdentifier: "MatchCollectionViewCell",
                                                                                     cellType: MatchCollectionViewCell.self)) {
                                                                                        row, match, cell in
                                                                                        cell.bind(match: match)
                                                                                        cell.layoutIfNeeded()
        }.disposed(by: disposeBag)
    }
    
    private func setupPlayersCollection(){
        playerCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        teamDetailsViewModel.teamPlayer.bind(to: playerCollectionView.rx.items(cellIdentifier: "PlayerCollectionViewCell",
                                                                               cellType: PlayerCollectionViewCell.self)) {
                                                                                row, player, cell in
                                                                                cell.bind(player: player)
                                                                                cell.layoutIfNeeded()
        }.disposed(by: disposeBag)
    }
    
    private func setupView(){
        guard let team = self.teamDetailsViewModel.getTeam() else {
            return
        }
        teamHeaderView.bind(name: team.name, imageUrl: team.imageUrl)
    }
    
    public func setupViewModel(teamDetailsViewModel: TeamDetailsViewModel){
        self.teamDetailsViewModel = teamDetailsViewModel
    }
}

extension TeamDetailsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.matchesCollectionView{
            return MatchCollectionViewCell.cellSize
        }else{
            return PlayerCollectionViewCell.cellSize
        }
    }
}
