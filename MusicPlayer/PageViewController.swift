//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 姜又寧 on 2021/11/24.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet weak var changImageView: UIImageView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var singerNameLabel: UILabel!
    @IBOutlet weak var musicLabel: UILabel!
    
    let musicImageName : [String] = ["closer", "cmon", "justBeMine"]
    let musicNameLabel : [String] = ["Closer", "C'MON", "Just Be Mine"]
    let musicSingerLabel : [String] = ["The Chainsmokers", "Ke$ha", "Cher Lloyd"]
    var number : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //讀取畫面時執行syncData()內容
        syncData()
    }
    
    //同步讀取
    func syncData() {
        //圖檔
        self.changImageView.image = UIImage(named: musicImageName[self.number])
        //歌曲名稱
        self.musicLabel.text = self.musicNameLabel[self.number]
        //歌手名稱
        self.singerNameLabel.text = self.musicSingerLabel[self.number]
        //pageController選項
        self.pageController.currentPage = self.number
        //segmentedControl選項
        self.segmentedControl.selectedSegmentIndex = self.number
        //同步SegmentedControl裡面的音樂名稱
        for name in 0...self.musicNameLabel.count - 1 {
            self.segmentedControl.setTitle(self.musicNameLabel[name], forSegmentAt: name)
        }
    }
    
    //改變PageController
    @IBAction func changePageView(_ sender: UIPageControl) {
        let number = sender.currentPage
        switch number {
        case 0:
            self.number = 0
            syncData()
        case 1:
            self.number = 1
            syncData()
        case 2:
            self.number = 2
            syncData()
        default:
            break
        }
    }
    
    //改變SegmentedControl
    @IBAction func changeSegmentedView(_ sender: UISegmentedControl) {
        let number = sender.selectedSegmentIndex
        switch number {
        case 0:
            self.number = 0
            syncData()
        case 1:
            self.number = 1
            syncData()
        case 2:
            self.number = 2
            syncData()
        default:
            break
        }
    }
    
    //上一頁按鈕
    @IBAction func backToMusicView(_ sender: Any) {
        if number > 0 {
            number -= 1
        }else if number == 0 {
            number = 2
        }
        syncData()
    }
    
    //下一頁按紐
    @IBAction func nextToMusicView(_ sender: Any) {
        if number < 2 {
            number += 1
        }else if number == 2{
            number = 0
        }
        syncData()
    }
    
    //點選圖片左右滑動
    @IBAction func swipeMusicView(_ sender: UISwipeGestureRecognizer) {
        let swipe = sender.direction
        switch swipe {
        case .left:
            if number < 2 {
                number += 1
            }else if number == 2{
                number = 0
            }
            syncData()
        case .right:
            if number > 0 {
                number -= 1
            }else if number == 0 {
                number = 2
            }
            syncData()
        default:
            break
        }
    }
    
}

