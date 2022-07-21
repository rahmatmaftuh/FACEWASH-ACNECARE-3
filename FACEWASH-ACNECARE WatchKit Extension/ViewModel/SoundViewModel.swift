//
//  SoundViewModel.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import Foundation

class SoundController: ObservableObject {
    static let shared = SoundController()
    
    @Published var voiceOn: Bool = true
}


