//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by Teruo Yamamoro on 2023/03/15.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var zoomImage: UIImageView!
    
    //ViewControllerからzoomViewという箱に画像を受け取る。
    //UIImage() → 画像を受け取るときの型っぽい
    var zoomView = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zoomImage.image = zoomView
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
