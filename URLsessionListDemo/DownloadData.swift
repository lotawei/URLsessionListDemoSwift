//
//  DownloadData.swift
//  URLsessionListDemo
//
//  Created by lotawei on 16/12/16.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

let    localpath:String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]

//下载任务模型类
struct  DownloadData {

    //任务请求url
    let    url:String!
    //任务名称
    let    name:String!
    
    //存储路径
    let   savepath:String!
    
    //下载好的任务
    var  tmpdata:NSData?
    
    
    
    init(url:String,name:String) {
        
        self.url  = url
        self.name = name
        self.savepath = localpath.appending("/\(name)")
        
    }
    
    
}
//下载类协议
@objc protocol   Downloaddelegate{
    //用于获取下载速度
//   @objc optional func    updateSpeed(speed:String,id:Int)
//    //用于更新进度
//    
//   @objc optional  func    updateProgress(pro:Int,id:Int)
//    //某个任务完成
//    
//    @objc optional func   completed(id:Int)
    
    
    
}



