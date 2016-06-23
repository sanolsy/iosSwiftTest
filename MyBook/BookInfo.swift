//
//  BookInfo.swift
//  MyBook
//
//  Created by MF839-002 on 2016. 6. 23..
//  Copyright © 2016년 MF839-002. All rights reserved.
//
import Foundation
import UIKit

class BookInfo {
    let title:String
    let writer:String
    let desc:String
    let cover:UIImage?
    
    init (_ newTitle:String,_ newWriter:String,_ newDesc:String,_ newCover:UIImage?) {
        title = newTitle
        writer = newWriter
        desc = newDesc
        cover = newCover
    }
    
    convenience init (newTitle:String, newWriter:String, newCover:UIImage?) {
        self.init(newTitle, newWriter, "EMPTY DESC", newCover)
    }
}

class BookInfoWeb: BookInfo {
    let bookURL:String?
    
    init(_ newTitle: String, _ newWriter: String, _ newDesc: String, _ newCover: UIImage?, _ newURL:String) {
        bookURL = newURL
        super.init("EMPTY_TITLE", "EMPTY_WRITER", "EMPTY_DESCRIPTION", nil)
    }
    
}