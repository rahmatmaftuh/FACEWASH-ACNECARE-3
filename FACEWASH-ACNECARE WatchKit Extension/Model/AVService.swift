//
//  AVService.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import Foundation
import AVFoundation
//import AVFAudio

//MARK: BEEP COUNTDOWN

class AVServiceCountdown {
   var player : AVAudioPlayer?
    let session = AVAudioSession.sharedInstance()
   static let shared = AVServiceCountdown()

    func playMusic(){
        do {
            try session.setCategory(AVAudioSession.Category.playback,
                                    mode: .default,
                                    policy: .default,
            options: [])
        } catch {
            print("error loading session")
        }
        
        
        //akses alamat
        let path = Bundle.main.path(forResource: "beepCountdown", ofType:"mp3") ?? ""
        
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
//            player?.play()
        } catch {
            print("couldn't load countdown")
            // couldn't load file :(
        }
        
        session.activate(options: []) { (succes, error) in
            guard error == nil else {
                print(error!)
                return
                
            }
            
            self.player?.play()
            
        }
    }
}


class GuidelineSounds{
   var player : AVAudioPlayer?
   static let shared = GuidelineSounds()
    let session = AVAudioSession.sharedInstance()

    
//
//    func prepareSession() {
//        do {
//            try session.setCategory(AVAudioSession.Category.playback,
//                                    mode: .default,
//                                    policy: .longFormAudio,
//            options: [])
//        } catch {
//            print("error loading session")
//        }
//    }
//
    func playMusic(sound: URL){
        do {
            try session.setCategory(AVAudioSession.Category.playback,
                                    mode: .default,
                                    policy: .default,
            options: [])
        } catch {
            print("error loading session")
        }
        do {
            player = try AVAudioPlayer(contentsOf: sound)
            
//            player?.play()
        } catch {
            print("couldn't play guideline")
        }
        
        session.activate(options: []) { (succes, error) in
            guard error == nil else {
                print(error!)
                return
                
            }
            self.player?.play()
            
        }
    }
}

