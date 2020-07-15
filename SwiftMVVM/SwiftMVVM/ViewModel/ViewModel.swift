//
//  ViewModel.swift
//  SwiftMVVM
//
//  Created by SeongJoon Kim on 2020/07/15.
//  Copyright © 2020 SeongJoon Kim. All rights reserved.
//

import Foundation



protocol ViewModelProtocol: class {
        
    init()
    var videosDidChanged:((ViewModelProtocol) -> Void)? {get set}
    func addVideo()
    var videos:[Video]!{get set}
}

class ViewModel: ViewModelProtocol{

    
    var videosDidChanged: ((ViewModelProtocol) -> Void)?
    
    var videos: [Video]!{
        didSet{
            self.videosDidChanged?(self)
        }
    }
    
    required init() {
        fetchVideos()
    }
    
    func fetchVideos(){
        
        videos = [
            Video(videoTitle: "1번째", videoUrl: "https://www.naver.com"),
            Video(videoTitle: "2번째", videoUrl: "https://www.naver.com"),
            Video(videoTitle: "3번째", videoUrl: "https://www.naver.com"),
            Video(videoTitle: "4번째", videoUrl: "https://www.naver.com"),
            Video(videoTitle: "5번째", videoUrl: "https://www.naver.com"),
            Video(videoTitle: "6번째", videoUrl: "https://www.naver.com"),
            Video(videoTitle: "7번째", videoUrl: "https://www.naver.com")
        ]
    }
    
    func addVideo(){
        let videosCnt = videos.count
        videos.append(Video(videoTitle: "\(videosCnt + 1 )번째", videoUrl: "new Url"))
    }
    
}
