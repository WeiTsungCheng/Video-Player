//
//  VideoViewController.swift
//  VideoPlayer
//
//  Created by Wei-Tsung Cheng on 2017/9/6.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideoViewController: UIViewController {



  //  var tableView: UITableView!
    var searchController: UISearchController!

    var playButton: UIButton!
    var muteButton: UIButton!
    var videoView: UIView!
    var player:AVPlayer!
    var playBool:Bool! = false

    var muteBool:Bool! = false


    func clickPlayButton() {


        if playBool == true{

            playButton.setTitle("Play", for: .normal)
            player.pause()
            playBool = false

        }else{

            playButton.setTitle("Pause", for: .normal)
            player.play()
            playBool = true

        }


    }

    func clickMuteButton() {

        if
            muteBool == true{

            muteButton.setTitle("Unmute", for: .normal)
            player.isMuted = true
            muteBool = false

        }else{

            muteButton.setTitle("Mute", for: .normal)
            player.isMuted = false
            muteBool = true
        }


    }









    override func viewDidLoad() {
        super.viewDidLoad()

        videoView = UIView(frame: CGRect(x: 0, y: 64, width: 375, height: 564))
        videoView.backgroundColor = .black
        self.view.addSubview(videoView)

        playButton = UIButton(frame: CGRect(x: 0, y: 623, width: 74, height: 44))
        playButton.setTitleColor(.white, for: .normal)

        playButton.setTitle("Pause", for: .normal)
        playButton.isEnabled = true

        playButton.addTarget(
            self,
            action: #selector(VideoViewController.clickPlayButton),
            for: .touchUpInside)

        muteButton = UIButton(frame: CGRect(x: 304, y: 623, width: 74, height: 44))
        muteButton.setTitle("Mute", for: .normal)
        muteButton.isEnabled = true

        muteButton.addTarget(
            self,
            action: #selector(VideoViewController.clickMuteButton),
            for: .touchUpInside)


        self.view.addSubview(playButton)
        self.view.addSubview(muteButton)

        self.view.backgroundColor = UIColor.black


        self.searchController =
            UISearchController(searchResultsController: nil)

        self.searchController.searchBar.searchBarStyle =
            .prominent

        searchController.searchBar.barTintColor = UIColor.black

        searchController.searchBar.frame = CGRect(x: 8, y: 20, width: 359, height: 30)

        searchController.searchBar.placeholder = "Enter URL of video"

        self.view.addSubview(searchController.searchBar)



        let url = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")

        player = AVPlayer(url: url!)

        let playerLayer = AVPlayerLayer(player: player)

        playerLayer.frame = self.videoView.bounds

        self.videoView.layer.addSublayer(playerLayer)

        player.play()

        playBool = true


    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
