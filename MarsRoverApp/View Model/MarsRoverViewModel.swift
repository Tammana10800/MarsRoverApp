//
//  MarsRoverViewModel.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import Foundation
import Combine

class MarsRoverViewModel: ObservableObject {
    @Published var viewState: ViewState = .initialize
    
    private let realmService = RealmService()
    
    func loadPhotosData() {
        viewState = .loading
        
        NetworkManager.shared.fetchRoverPhotos { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
            
                switch result {
                case .success(let photos):
                    self.viewState = .success(photos)
                    
                    //Save data for offline caching
                    let cachedPhotos = photos.map { photo -> CachedMarsRoverPhoto in
                        let cached = CachedMarsRoverPhoto()
                        cached.id = photo.id
                        cached.imgSrc = photo.imgSrc
                        cached.earthDate = photo.earthDate
                        cached.cameraName = photo.camera.fullName
                        
                        let cachedRover = CachedMarsRover()
                        cachedRover.id = photo.rover.id
                        cachedRover.name = photo.rover.name
                        cachedRover.landingDate = photo.rover.landingDate
                        cachedRover.launchDate = photo.rover.launchDate
                        cachedRover.status = photo.rover.status
                        
                        cached.rover = cachedRover
                        return cached
                    }
                    self.realmService.saveRoverPhotos(cachedPhotos)
                    
                case .failure(let error):
                    
                    let cachedPhotos = self.realmService.fetchCachedPhotos()
                    
                    if cachedPhotos.isEmpty {
                        self.viewState = .apiError(error)
                    } else {
                        let photos = cachedPhotos.map { cached in
                            MarsPhoto(
                                id: cached.id,
                                sol: 0,
                                camera: RoverCamera(id: 0, name: "", roverID: 0, fullName: cached.cameraName),
                                imgSrc: cached.imgSrc,
                                earthDate: cached.earthDate,
                                rover: MarsRover(
                                    id: cached.rover?.id ?? 0,
                                    name: cached.rover?.name ?? "",
                                    landingDate: cached.rover?.landingDate ?? "",
                                    launchDate: cached.rover?.launchDate ?? "",
                                    status: cached.rover?.status ?? ""
                                )
                            )
                        }
                        
                        self.viewState = .success(photos)
                    }
                }
            }
        }
        
    }
}
