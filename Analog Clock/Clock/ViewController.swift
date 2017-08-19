//
//  ViewController.swift
//  Clock
//
//  Created by Life is Tech! on 2014/12/31.
//  Copyright (c) 2014年 Life is Tech!. All rights reserved.
//  AnalogClock

import UIKit

class ViewController: UIViewController {

    // まずは使う部品を宣言する！
    // 時計の盤面, 針
    @IBOutlet var banmenImage: UIImageView!
    @IBOutlet var byoushinImage: UIImageView!
    @IBOutlet var tanshinImage: UIImageView!
    @IBOutlet var choushinImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            //書いた段階ではエラー
            selector: #selector(self.analog),
            userInfo: nil,
            repeats:true)
        
            timer.fire()
    }
    
    


    func analog(){
        // 現在の時刻を取得する
        let date: Date = Date()
        //時間, 分, 秒を取得
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let dateComps: DateComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        
        // 回転角度を計算
        let minute: CGFloat = CGFloat(60 * dateComps.hour! + dateComps.minute!)
//        let kakudo: CGFloat = CGFloat(minute * CGFloat.pi / 360.0)
        
        let rotateHour: CGAffineTransform = CGAffineTransform(rotationAngle: minute * CGFloat.pi / 360.0)
        
        
        let rotateMin: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(dateComps.minute!) * CGFloat.pi / 60.0)
        
        let rotateSec: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(dateComps.second!) * CGFloat.pi / 60.0)
        
        // アニメーションをつけて実行
        // アニメーションを作成
        let roundAnimation = CABasicAnimation(keyPath: "transform")
        
        // アニメーションを遅らせる→1秒ごとに動かす
            roundAnimation.duration = 0.1
        
            byoushinImage.transform = rotateSec
            tanshinImage.transform = rotateMin
            choushinImage.transform = rotateHour
        }

    }


