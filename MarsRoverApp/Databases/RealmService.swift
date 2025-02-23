//
//  RealmSwift.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import RealmSwift

class RealmService {
    private let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    // Save photos
    func saveRoverPhotos(_ photos: [CachedMarsRoverPhoto]) {
        do {
            try realm.write {
                let existingPhotos = realm.objects(CachedMarsRoverPhoto.self)
                
                // Compare data
                if existingPhotos.count != photos.count {
                    // Clear old cache and save new data
                    realm.delete(existingPhotos)
                    realm.add(photos, update: .modified)
                }
            }
        } catch {
            print("Error saving photos to Realm: \(error.localizedDescription)")
        }
    }
    
    // Fetch cached photos
        func fetchCachedPhotos() -> [CachedMarsRoverPhoto] {
            let results = realm.objects(CachedMarsRoverPhoto.self)
            return Array(results)
        }
    
    // Clear cache
      func clearCache() {
          do {
              try realm.write {
                  realm.delete(realm.objects(CachedMarsRoverPhoto.self))
              }
          } catch {
              print("Error clearing cache: \(error.localizedDescription)")
          }
      }
}
