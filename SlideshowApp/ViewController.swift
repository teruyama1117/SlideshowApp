//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Teruo Yamamoro on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    
    //画像用の箱
    var currentIndex = 0
    
    //タイマーの箱
    var timer: Timer!
    
    //画像
    let imageslol = [
        UIImage(named: "Soraka.jpeg")!,
        UIImage(named: "Ahri.jpeg")!,
        UIImage(named: "Zed.jpeg")!
        ]
    
    //タップ判定処理を生成
    //@objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
       // print ("imageViewTapped")
       // }
    //初期画面
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageWindow.image = UIImage(named: "Soraka.jpeg")
        //iamgeWindowにタップ機能を追加
        imageWindow.isUserInteractionEnabled = true
        //imageWindow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("zoom")
        //segueから遷移先ZoomViewControllerを取得するコード
        let ZoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        // 遷移先で宣言しているzoomViewに現在の画像を渡す
        ZoomViewController.zoomView = imageslol [currentIndex]
        
        //タイマーがnilではない（動いている状態）であれば、止める。
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextOutlet.isEnabled = true
            prevOutlet.isEnabled = true
            playStopOutlet.setTitle("再生", for: .normal)
            }
        }
        
    @IBOutlet weak var imageWindow: UIImageView!
    
    //イメージを変える処理 func
    @objc func changeimage() {
        if currentIndex == 0 {
            currentIndex = 1}
        else if currentIndex == 1{
            currentIndex = 2}
        else if currentIndex == 2{
            currentIndex = 0}
        //＜方法２＞
        //currentIndex += 1
        //if currentIndex == imageslol.count { //.countでフルカウントって意味っぽい
            //currentIndex = 0}
        
        //これでimageView画面に入れる。
        imageWindow.image = imageslol [currentIndex]
        }
    
    //進む
    @IBOutlet weak var nextOutlet: UIButton!
    @IBAction func next(_ sender: Any) {
        print ("next")
        if currentIndex == 0 {
            currentIndex = 1}
        else if currentIndex == 1{
            currentIndex = 2}
        else if currentIndex == 2{
            currentIndex = 0}
        
        //これでimageView画面に入れる。
        imageWindow.image = imageslol [currentIndex]
        }
    
    //戻る
    @IBOutlet weak var prevOutlet: UIButton!
    @IBAction func prev(_ sender: Any) {
        print ("prev")
        if currentIndex == 0 {
            currentIndex = 2}
        else if currentIndex == 2{
            currentIndex = 1}
        else if currentIndex == 1{
            currentIndex = 0}
        
        //これでimageView画面に入れる。
        imageWindow.image = imageslol [currentIndex]
        }
    
    //再生・停止
    @IBOutlet weak var playStopOutlet: UIButton!
    @IBAction func playStop(_ sender: Any) {
        print ("playStop")
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeimage), userInfo: nil, repeats: true)
                nextOutlet.isEnabled = false
                prevOutlet.isEnabled = false
                playStopOutlet.setTitle("停止", for: .normal)
            }
            else if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
                nextOutlet.isEnabled = true
                prevOutlet.isEnabled = true
                playStopOutlet.setTitle("再生", for: .normal)
            }
        }
    
    //@IBAction func imageTapped(_ sender: Any) {
       // print ("tapped")
    //}
        
    @IBAction func unwind (_ segue: UIStoryboardSegue) {
        // 拡大画面からsegueで戻る用
        print ("out")
    }
}

