//
//  MarsPhoto.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//


struct MarsPhoto: Codable, Identifiable {
    let id: Int
    let sol: Int
    let camera: RoverCamera
    let imgSrc: String
    let earthDate: String
    let rover: MarsRover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}