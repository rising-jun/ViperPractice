//
//  DataModel.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/14.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import SwiftSoup
import RxSwift
import RxCocoa

class DataModel{
    private let disposeBag = DisposeBag()
    
    func getNetFlixTop10() -> Observable<Array<NetflixData>>{
        let urlAddress = "https://flixpatrol.com/top10/netflix/south-korea/"
        let url = URL(string: urlAddress)
        let request = URLRequest(url: url!)
        return URLSession.shared.rx.response(request: request)
            .map{
            var netflixDataArray: Array<NetflixData> = []
            let html = String(data: $0.data, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html ?? "nil")
            //print("docs : \(doc)")
            let firstLinkTitles: Array<Elements.Element> = try doc.select("div.site-wrap").select("div.site-section").select("div.mt-3").select("a").array()
                for i in 0 ..< (firstLinkTitles.count){
                    if(i < (firstLinkTitles.count / 2)){
                        netflixDataArray.append(NetflixData())
                        netflixDataArray[i]._movie = try firstLinkTitles[i].text()
                    }else{
                        netflixDataArray[i - (firstLinkTitles.count/2)]._drama = try firstLinkTitles[i].text()
                    }
            }
            return netflixDataArray
        }.observeOn(MainScheduler.instance)
    }
    
    func getNaverTop10() -> Observable<Array<String>>{
        let urlAddress = "https://datalab.naver.com/keyword/realtimeList.naver?entertainment=2&groupingLevel=4&marketing=2&news=2&sports=2"
        let url = URL(string: urlAddress)
        let request = URLRequest(url: url!)
        return URLSession.shared.rx.response(request: request)
            .map{
            var naverDataArray: Array<String> = []
            let html = String(data: $0.data, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html ?? "nil")
            let firstLinkTitles: Array<Elements.Element> = try doc.select("div#content").select("div.list_group").select("span.item_title").array()
            for e in firstLinkTitles{
                naverDataArray.append(try e.text())
            }
           return naverDataArray
        }.observeOn(MainScheduler.instance)
    }
    
    func getInstaTop10() -> Observable<Array<String>>{
        let urlAddress = "https://www.tagsfinder.com/ko-kr/stats/"
        let url = URL(string: urlAddress)
        let request = URLRequest(url: url!)
        return URLSession.shared.rx.response(request: request)
            .map{
            var instaDataArray: Array<String> = []
            let html = String(data: $0.data, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html ?? "nil")
                let firstLinkTitles: Array<Elements.Element> = try doc.select("div.col-lg-6").select("div.card").select("table").select("a").array()
            for e in firstLinkTitles{
                instaDataArray.append(try e.text())
            }
            return instaDataArray
        }.observeOn(MainScheduler.instance)
    }
    
}
