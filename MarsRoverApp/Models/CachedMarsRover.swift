//
//  CachedMarsRover.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import RealmSwift

class CachedMarsRover: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var landingDate: String
    @Persisted var launchDate: String
    @Persisted var status: String
}
