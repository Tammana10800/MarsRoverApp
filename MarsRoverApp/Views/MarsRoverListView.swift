//
//  MarsRoverListView.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import SwiftUI

struct MarsRoverListView: View {
    
    let photos: [MarsPhoto]
    
    var body: some View {
        List(photos) { photo in
            NavigationLink(destination: MarsRoverPhotoDetailView(photo: photo)) {
                HStack {
                    CachedAsyncImageView(urlString: photo.imgSrc.replacingOccurrences(of: "http://", with: "https://"))
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading) {
                        Text("Rover: ") + Text(photo.rover.name).bold().foregroundColor(.blue)
                        Text("Landing Date: ") + Text(photo.rover.landingDate).bold().foregroundColor(.green)
                        Text("Launch Date: ") + Text(photo.rover.launchDate).bold().foregroundColor(.purple)
                        Text("Status: ") + Text(photo.rover.status)
                            .bold()
                            .foregroundColor(photo.rover.status.lowercased() == "active" ? .green : .red)
                    }
                }
            }
        }
    }
}
