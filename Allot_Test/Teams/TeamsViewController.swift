//
//  ViewController.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import UIKit
import RxSwift


class TeamsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var teamViewModel: TeamViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UEFA_Champions_League_Teams".localized
        teamViewModel = TeamViewModel()
        setupTableView()
    }
    
    private func setupTableView(){
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        teamViewModel.teams.bind(to: tableView.rx.items(cellIdentifier: "TeamCell",
                                                        cellType: TeamCell.self)) {
                                                            row, team, cell in
                                                            cell.bind(name: "\(team.name)")
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let selectedTeam = self?.teamViewModel.getSelectedTeam(index: indexPath.row) else{
                    return
                }
                self?.goToDetailsView(team: selectedTeam)
            }).disposed(by: disposeBag)
    }
    
    private func goToDetailsView(team: Team){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let teamDetailsVC: TeamDetailsViewController = storyboard.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        let teamDetailsVM = TeamDetailsViewModel(team: team)
        teamDetailsVC.setupViewModel(teamDetailsViewModel: teamDetailsVM)
        self.navigationController?.pushViewController(teamDetailsVC, animated: true)
    }
}

extension TeamsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}



