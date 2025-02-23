//
//  RoverCamera.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//


// Rover Camera
struct RoverCamera: Codable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}