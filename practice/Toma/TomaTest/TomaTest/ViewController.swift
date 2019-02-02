//
//  ViewController.swift
//  TomaTest
//
//  Created by 鈴木透馬 on 2019/02/02.
//  Copyright © 2019 TMF-Project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var image_view: UIImageView!
    @IBOutlet var label: UILabel!

    @IBOutlet var talk: UIButton!
    @IBOutlet var conv: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named:"download.jpg")
        image_view.image = image
        label.lineBreakMode = .byWordWrapping
        label.text = "10回に1回不適切な発言をするドラえもん"
        conv.text = "僕はドラえもんだよ。一緒にお話しよう！"

    }
    
    @IBAction func talked(_ sender: Any) {
        
        let random: Int = (Int)(arc4random_uniform(10))
        if (random < 3){
            conv.text = "僕は未来から来た人型ロボットだよ。"
        } else if (3 <= random && random < 6){
            conv.text = "たくさんの秘密道具を使えるよ。"
        } else if (6 <= random && random < 9){
            conv.text = "どこでもドア〜〜〜"
        } else {
            conv.text = "ちんぽ"
        }
        
    }
    
}

