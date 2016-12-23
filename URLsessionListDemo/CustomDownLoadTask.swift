//
//  DownLoadTask.swift
//  URLsessionListDemo
//
//  Created by lotawei on 16/12/16.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class CustomDownLoadTask:Downloaddelegate{
 
    

    var   delegate:Downloaddelegate?
    
    
    let  taskid:Int!
    
    var  data:DownloadData?
    
    var    task:URLSessionDownloadTask?
    var  speed:[Int] = [Int]()
    
    let   config = URLSessionConfiguration.default
    
    
    var   timer:Timer?
    
    
    init(data:DownloadData,delegate:Downloaddelegate,id:Int) {
        
        self.data  = data
        
        self.delegate = nil
        
        self.taskid  = id
        
        
    }
   @objc func update(){
    
    
   }
    
   
    
    
    func startDownLoadTask()  {
        
        let  session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
        
        
        if let   tmpdata = self.data?.tmpdata {
            
            task  = session.downloadTask(withResumeData: tmpdata as Data)
            
            print("\(self.taskid):continue  downloading")
            
            self.data?.tmpdata = nil
            
            
        }
        else{
            if let    url  =  URL(string:(self.data?.url)!) {
                
                task = session.downloadTask(with: url)
                
               print("\(self.taskid):start  downloading")
                
            }
        }
        //开始下载
        task?.resume()
        
        
        //清零计时器
        timer?.invalidate()
        
        //一0.25秒  出发update
        timer =   Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        
        
        
    }
   

}


//extension     CustomDownLoadTask:URLSessionTaskDelegate{
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        
//        
//        
//        
//        
//    }
//    
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        
//    }
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
//        
//    }
//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        
//    }
//}
