//
//  BookDetailViewController.swift
//  MyBook
//
//  Created by MF839-002 on 2016. 6. 23..
//  Copyright © 2016년 MF839-002. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookWriter: UILabel!
    @IBOutlet weak var bookDesc: UITextView!
    
    var book:BookInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let newBook = book {
            coverImageView.image = newBook.cover
            bookTitle.text = newBook.title
            bookWriter.text = newBook.writer
            bookDesc.text = newBook.desc
            navigationItem.title = newBook.title
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
