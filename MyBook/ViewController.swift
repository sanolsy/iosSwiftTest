//
//  ViewController.swift
//  MyBook
//
//  Created by MF839-002 on 2016. 6. 23..
//  Copyright © 2016년 MF839-002. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var myBooks = [BookInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        myBooks = loadBookData()
        print(myBooks)
        
        
    }

    override func viewDidAppear(animated: Bool) {
//        showLoginPopup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myBooks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("book_cell", forIndexPath: indexPath) as! BookTableViewCell
        
        // Configure the cell...
        
        cell.bookTitle.text = myBooks[indexPath.row].title
        cell.bookWriter.text = myBooks[indexPath.row].writer
        cell.coverImageView.image = myBooks[indexPath.row].cover
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let bdVC = segue.destinationViewController as? BookDetailViewController
            
        let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)
            
        if let vc = bdVC {
            vc.book = myBooks[indexPath!.row]
        }
    }
    
    func loadBookData() -> [BookInfo] {
        let book1 = BookInfo("Swift로 하는 iOS 프로그래밍", "매트 뉴버그", "이 책은 스위프트(Swift) 언어를 이용해서 iOS 애플리케이션을 개발하려는 프로그래머, 오브젝티브C 문법에 익숙한 개발자, 그리고 iOS 인터페이스 구성과 작동 원리, 구현 철학을 이해하려는 UI 디자이너를 위한 iOS 앱 개발 입문서다. 스위프트의 기본 철학과 구현 원리를 소개하고, 아이폰과 아이패드 애플리케이션 개발을 위한 코코아(Cocoa) 프레임워크를 스위프트로 구현하기 위한 방법을 매우 세심하게 설명한다. 또, 스위프트의 강력한 기능인 프로토콜, 제너릭과 코코아 프레임워크의 이벤트 구동형 모델, 애플리케이션 개발의 주요 디자인 패턴, 그리고 핵심 기능을 설명한다. 전체적으로는 iOS 8 버전에 기반을 두고 기술되어있지만, iOS 버전에 구애 받지 않고 오래 참고할 수 있는 기본서로서, iOS 9에서 새로 추가된 기능을 iOS 8과 비교한 ‘한국어판 특별 부록’도 수록했다. ", UIImage(named: "1"))
        
        let book2 = BookInfo("핵심만 골라 배우는 iOS 9 프로그래밍", "닐 스미스", "우리가 즐겨 사용하는 모바일 디바이스인 아이폰과 아이패드! 멋진 성능을 자랑하는 이 기기들도 그것을 움직일 운영체제나 소프트웨어가 없다면 아무런 소용이 없다. 이 책은 애플의 스마트한 기기들로 다양한 일을 할 수 있도록 해주는 iOS 9 운영체제와 애플리케이션 프로그래밍에 대한 모든 것을 담은 책이다. iOS 9으로 프로그래밍을 하고자 하는 모든 분에게 아주 좋은 자습서이자 참고서가 되어줄 것이다. ", UIImage(named: "2"))
        
        let book3 = BookInfo("Swift 프로그래밍 쉽게 따라 하기", "장해인", "Swift 언어를 이용한 앱 만들기, 기초부터 활용법까지 예제를 따라 하면서 배울 수 있는 책! 누구든지 쉽게 개발 언어를 배워서 앱을 만들 수 있는 Swift 언어에 대해 알려준다.", UIImage(named: "3"))
        let books = [book1, book2, book3]
        return books
    }
    
    func showLoginPopup() {
        let loginAlert = UIAlertController(title: "Login",
                                           message: "로그인 정보를 입력하세요",
                                           preferredStyle: .Alert)
    
        loginAlert.addTextFieldWithConfigurationHandler() {
            (idTextField) in
            idTextField.placeholder = "ID"
        }
        
        loginAlert.addTextFieldWithConfigurationHandler() {
            (passwordTextField) in
            passwordTextField.secureTextEntry = true
            passwordTextField.placeholder = "Password"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Cancel,
                                         handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default) {
            (_) in
            let loginId = loginAlert.textFields?[0].text
            let password = loginAlert.textFields?[1].text
            
            if loginId == "test" && password == "1234" {
                print("로그인 성공")
            } else {
                print("로그인 실패")
            }
                                            
        }
        
        loginAlert.addAction(cancelAction)
        loginAlert.addAction(confirmAction)
        
        self.presentViewController(loginAlert, animated: true, completion: nil)
    }
}

