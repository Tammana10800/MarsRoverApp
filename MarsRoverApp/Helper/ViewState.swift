//
//  ViewState.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//


enum ViewState {
    case initialize
    case loading
    case success([MarsPhoto])
    case apiError(Error?)
}
