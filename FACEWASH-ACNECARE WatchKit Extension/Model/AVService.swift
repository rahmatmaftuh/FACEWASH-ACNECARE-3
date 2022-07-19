//
//  AVService.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import Foundation
import AVFoundation

class AVService{
    var player : AVAudioPlayer?
    static let shared = AVService()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "siri", ofType:"mp3") ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

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
            // couldn't load file :(
        }
    }
}

class GuidelineStep1{
   var player : AVAudioPlayer?
   static let shared = GuidelineStep1()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "step1Nose", ofType:"mp3") ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

class GuidelineStep2{
   var player : AVAudioPlayer?
   static let shared = GuidelineStep2()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "step2Forehead", ofType:"mp3") ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

class GuidelineStep3{
   var player : AVAudioPlayer?
   static let shared = GuidelineStep3()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "step3Cheek", ofType:"mp3") ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

class GuidelineStep4{
   var player : AVAudioPlayer?
   static let shared = GuidelineStep4()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "step4Chin", ofType:"mp3") ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}
