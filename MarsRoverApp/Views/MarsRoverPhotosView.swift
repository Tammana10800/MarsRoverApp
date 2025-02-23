//
//  MarsRoverPhotosView.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import SwiftUI

struct MarsRoverPhotosView: View {

    @State private var isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    @StateObject private var viewModel = MarsRoverViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.viewState {
                case .initialize:
                    EmptyView()
                case .loading:
                    ProgressView("Loading ...")
                case .success(let photos):
                    MarsRoverListView(photos: photos)
                case .apiError(let error):
                    Text("Error: \(error?.localizedDescription ?? "")")
                }
            }
            .navigationTitle("Mars Rover List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isDarkMode.toggle()
                        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
                    }) {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(isDarkMode ? .yellow : .blue)
                    }
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .onAppear {
                isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
                viewModel.loadPhotosData()
            }
        }
    }
}

#Preview {
    MarsRoverPhotosView()
}
