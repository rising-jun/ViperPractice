//
//  NexflixData.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/16.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
struct  NetflixData{
    private var movie: String = ""
    public var _movie: String{
        get{
            return self.movie
        }set(val){
            self.movie = val
        }
    }
   
    private var drama: String = ""
    public var _drama: String{
         get{
             return self.drama
         }set(val){
             self.drama = val
         }
     }
}

