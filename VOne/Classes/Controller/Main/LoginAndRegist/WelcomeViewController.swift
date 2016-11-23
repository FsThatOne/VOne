//
//  WelcomeViewController.swift
//  VOne
//
//  Created by 王正一 on 16/11/22.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

class WelcomeViewController: UIViewController {
    
    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    var contentURL: URL? {
        didSet {
            setMoviePlayer(contentURL!)
        }
    }
    
    var videoFrame: CGRect = CGRect()
    var startTime: CGFloat = 0.0
    var duration: CGFloat = 0.0
    var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd) , name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }

    convenience init(vFrame: CGRect, sTime: CGFloat) {
        self.init()
        videoFrame = vFrame
        startTime = sTime
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - 设置界面相关
extension WelcomeViewController {
    
}


// MARK: - 设置media播放相关
extension WelcomeViewController {
    fileprivate func setMoviePlayer(_ url: URL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as URL? {
                self.moviePlayer.player = AVPlayer(url: path)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }
}


// MARK: - VideoCutter模型
class VideoCutter: NSObject {
    func cropVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?) {
        DispatchQueue.global().async {
            let asset = AVURLAsset(url: url, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            } catch _ {
            }
            outputURL = outputURL.NS.appendingPathComponent("output.mp4")
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ {
            }
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileTypeMPEG4
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously { () -> Void in
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL, nil)
                    case AVAssetExportSessionStatus.failed:
                        print("Failed: \(exportSession.error)")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed: \(exportSession.error)")
                    default:
                        print("default case")
                    }
                }
            }
        }
    }
}

extension String {
    var NS: NSString { return (self as NSString) }
}

