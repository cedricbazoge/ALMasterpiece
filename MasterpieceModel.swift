//
//  MasterpieceModel.swift
//  AutoLayoutTable
//
//  Created by Cedric Bazoge on 12/12/15.
//  Copyright © 2015 TWC. All rights reserved.
//

import UIKit

class MasterpieceModel: NSObject {
    
    var artist:String?
    var artistDate:String?
    var title:String?
    var date:String?
    var thumbnail:UIImage?
    var comment:String?

    convenience init(item:Dictionary<String,AnyObject>){
        self.init()
        artist = item["artist"] as? String
        artistDate = item["artistdates"] as? String
        title = item["title"] as? String
        date = item["date"] as? String
        if let image = UIImage(named: (item["url"] as? String)!) {
            thumbnail = image
        }
        comment = item["description"] as? String
        
    }
}
