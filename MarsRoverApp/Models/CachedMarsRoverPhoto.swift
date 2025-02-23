//
//  CachedMarsRoverPhoto.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import RealmSwift

class CachedMarsRoverPhoto: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var imgSrc: String
    @Persisted var earthDate: String
    @Persisted var cameraName: String
    @Persisted var rover: CachedMarsRover?
}
