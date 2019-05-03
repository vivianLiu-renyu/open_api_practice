//
//  SongTrackSortingTest.swift
//  open_api_practiceTests
//
//  Created by YenChen Huang on 2019/4/19.
//  Copyright © 2019 Search_Question_Avengers. All rights reserved.
//

import XCTest

class SongTrackSortingTest: XCTestCase {
    let songs:[SongTrackData] = [
        SongTrackData(songName: "Unit", artistName: "940 it's me", songCoverURL: "", releaseDate: "1987-02-14"),
        SongTrackData(songName: "aAp", artistName: "ㄔㄕㄇ", songCoverURL: "", releaseDate: "1987-02-14"),
        SongTrackData(songName: "中文", artistName: "Rest", songCoverURL: "", releaseDate: "1987-02-14"),
        SongTrackData(songName: "ㄎKe", artistName: "", songCoverURL: "", releaseDate: "1987-02-14"),
        SongTrackData(songName: "Pooooo", artistName: "", songCoverURL: "", releaseDate: "1987-02-14")
    ]
    
    func sortByReleaseDate() {
        
    }
    
}
