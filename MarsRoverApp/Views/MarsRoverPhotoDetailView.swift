//
//  MarsRoverPhotoDetailView.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//


import SwiftUI

struct MarsRoverPhotoDetailView: View {
    let photo: MarsPhoto

    var body: some View {
        VStack {
            CachedAsyncImageView(urlString: photo.imgSrc.replacingOccurrences(of: "http://", with: "https://"))
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()

            Text("Camera: \(photo.camera.fullName)")
                .font(.headline)
                .padding(.top, 10)

            Text("Date on Earth: \(photo.earthDate)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle(photo.rover.name)
    }
}
