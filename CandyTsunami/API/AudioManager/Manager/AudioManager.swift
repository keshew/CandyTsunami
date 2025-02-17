import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    var menuPlayer: AVAudioPlayer?
    var losePlayer: AVAudioPlayer?
    var winPlayer: AVAudioPlayer?
    
    @Published var backgroundVolume: Float {
        didSet {
            menuPlayer?.volume = backgroundVolume
            losePlayer?.volume = backgroundVolume
            winPlayer?.volume = backgroundVolume
        }
    }
    
    init() {
        self.backgroundVolume = UserDefaultsManager().loadVolumeSettings()
       
        loadMenuMusic()
        loadWinMusic()
        loadLoseMusic()
    }
    
    private func loadMenuMusic() {
        if let url = Bundle.main.url(forResource: "bg", withExtension: "mp3") {
            do {
                menuPlayer = try AVAudioPlayer(contentsOf: url)
                menuPlayer?.numberOfLoops = -1
                menuPlayer?.volume = backgroundVolume
                menuPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadLoseMusic() {
        if let url = Bundle.main.url(forResource: "lose", withExtension: "mp3") {
            do {
                losePlayer = try AVAudioPlayer(contentsOf: url)
                losePlayer?.numberOfLoops = -1
                losePlayer?.volume = backgroundVolume
                losePlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadWinMusic() {
        if let url = Bundle.main.url(forResource: "win", withExtension: "mp3") {
            do {
                winPlayer = try AVAudioPlayer(contentsOf: url)
                winPlayer?.numberOfLoops = -1
                winPlayer?.volume = backgroundVolume
                winPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    
    func playMenuMusic() {
        menuPlayer?.play()
    }
    
    func stopMenuMusic() {
        menuPlayer?.stop()
    }
    
    func playLoseMusic() {
        losePlayer?.play()
    }
    
    func stopLoseMusic() {
        losePlayer?.stop()
    }
    
    func playWinMusic() {
        winPlayer?.play()
    }
    
    func stopWinMusic() {
        winPlayer?.stop()
    }
}
