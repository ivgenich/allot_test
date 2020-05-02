//
//  NetworkManager.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation
import RxSwift

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    let serverUrl = "https://api.football-data.org/v2/"
    
    func getTeams(completionHandler: @escaping ([Team]) -> Void) {
        let url = URL(string: "\(serverUrl)competitions/CL/teams")!
        var getRequest = URLRequest(url: url)
        getRequest.addValue(Utils.getAuthToken(), forHTTPHeaderField: "X-Auth-Token")
        let task = URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            if let data = data,
                let teamResponse = try? JSONDecoder().decode(TeamResponse.self, from: data) {
                completionHandler(teamResponse.teams)
            }
        })
        task.resume()
    }
    
    
    func getUpcomingMatches(teamId: Int, completionHandler: @escaping ([Match]) -> Void) {
        let url = URL(string: "\(serverUrl)teams/\(teamId)/matches?status=SCHEDULED&limit=10")!
        var getRequest = URLRequest(url: url)
        getRequest.addValue(Utils.getAuthToken(), forHTTPHeaderField: "X-Auth-Token")
        let task = URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            if let data = data,
                let teamMatchesResponse = try? JSONDecoder().decode(TeamMatchesResponse.self, from: data) {
                completionHandler(teamMatchesResponse.matches)
            }
        })
        task.resume()
    }
    
    func getTeamDetails(teamId: Int, completionHandler: @escaping (TeamDetailsResponse) -> Void) {
        let url = URL(string: "\(serverUrl)teams/\(teamId)")!
        var getRequest = URLRequest(url: url)
        getRequest.addValue(Utils.getAuthToken(), forHTTPHeaderField: "X-Auth-Token")
        let task = URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            if let data = data,
                let teamDetailsResponse = try? JSONDecoder().decode(TeamDetailsResponse.self, from: data) {
                completionHandler(teamDetailsResponse)
            }
        })
        task.resume()
    }
}

