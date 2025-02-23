//
//  MarsRover.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//


// Mars Rover
struct MarsRover: Codable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id, name, status
        case landingDate = "landing_date"
        case launchDate = "launch_date"
    }
}