//
//  AVService.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import Foundation
import AVFoundation


//MARK: BEEP COUNTDOWN

class AVServiceCountdown{
   var player : AVAudioPlayer?
   static let shared = AVServiceCountdown()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "beepCountdown", ofType:"mp3") ?? ""
        
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            print("couldn't load countdown")
            // couldn't load file :(
        }
    }
}


class GuidelineSounds{
   var player : AVAudioPlayer?
   static let shared = GuidelineSounds()
    
    func playMusic(sound: URL){
       
        do {
            player = try AVAudioPlayer(contentsOf: sound)
            
            player?.play()
        } catch {
            print("couldn't play guideline")
        }
    }
}
