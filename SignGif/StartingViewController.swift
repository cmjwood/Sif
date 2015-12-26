//
//  StartingViewController.swift
//  SignGif
//
//  Created by Casey Wood on 12/19/15.
//  Copyright © 2015 Chris Wood. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating
{

    @IBOutlet weak var tableView: UITableView!
    
    var imageArray = ["o_6f08b5cb5ef3fafa-0","o_6f08b5cb5ef3fafa-0", "o_6f08b5cb5ef3fafa-0","o_6f08b5cb5ef3fafa-0","o_6f08b5cb5ef3fafa-0"]
    var searchVideoArray = [SearchVideo]()
    var filteredVideo = [SearchVideo]()
    var searchController:UISearchController!

    @IBOutlet weak var titleLogo: UIImageView!
    @IBOutlet weak var gifImages: UIImageView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifImages.animationImages = [
            UIImage(named: "o_6f08b5cb5ef3fafa-0")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-0")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-1")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-2")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-3")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-4")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-5")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-6")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-7")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-8")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-9")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-10")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-11")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-12")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-13")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-14")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-15")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-16")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-17")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-18")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-19")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-20")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-21")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-22")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-23")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-24")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-25")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-26")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-27")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-28")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-29")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-30")!,
                UIImage(named: "o_6f08b5cb5ef3fafa-31")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-32")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-33")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-34")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-35")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-36")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-37")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-38")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-39")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-40")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-41")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-42")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-43")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-44")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-45")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-46")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-47")!,
            UIImage(named: "o_6f08b5cb5ef3fafa-48")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-49")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-50")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-51")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-52")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-53")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-54")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-55")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-56")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-57")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-58")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-59")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-60")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-61")!,
//            UIImage(named: "o_6f08b5cb5ef3fafa-62")!,
        ]
        
        gifImages.animationDuration = 4
        gifImages.startAnimating()
    

        let titleLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        titleLogo.contentMode = .ScaleAspectFit
        let image = UIImage(named: "Sif logo")
        titleLogo.image = image
        navigationItem.titleView = titleLogo
//        self.gifImages += [UIImage(named: "o_6f08b5cb5ef3fafa-0")];
//        self.gifImages += [UIImage(named: "o_6f08b5cb5ef3fafa-0")!,
//        self.gifImages += [UIImage(named: "o_6f08b5cb5ef3fafa-0")!,
//        self.gifImages += [UIImage(named: "o_6f08b5cb5ef3fafa-0")!,
        self.searchVideoArray += [SearchVideo(name: "Lol")]
        self.searchVideoArray += [SearchVideo(name: "Stoked")]
        self.searchVideoArray += [SearchVideo(name: "Excited")]
        self.searchVideoArray += [SearchVideo(name: "Score")]
        self.searchVideoArray += [SearchVideo(name: "Cool")]
        self.searchVideoArray += [SearchVideo(name: "Crazy")]
        self.searchVideoArray += [SearchVideo(name: "Bored")]
        self.searchVideoArray += [SearchVideo(name: "Hang out")]
        self.searchVideoArray += [SearchVideo(name: "Chill")]
        self.searchVideoArray += [SearchVideo(name: "Peace out")]
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        
        //MAKE SURE YOU RELOAD THE TABLE VIEW LAST
        
        //update table view
        self.tableView.reloadData()
    
    }

    
    
    //ADD THIS FUNCTION!!!!
    
    // Uupdate searching results
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text
        filterContentForSearchText(searchText!)
        tableView.reloadData()
        
    }
    
    
    //MARK: -Table View
    
    //set number of sections in table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (searchController.active){ //CHANGE tableView == self.searchDisplayController?.searchResultsTableView TO searchController.active
            
            return self.imageArray.count
            
        }else{
            
            return self.searchVideoArray.count
            
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        
        var video: SearchVideo
        
        if (searchController.active){ //CHANGE FROM tableView == self.searchDisplayController?.searchResultsTableView TO searchController.active !!!
            
            video = self.filteredVideo[indexPath.row]
            
        }else{
            
            video = self.searchVideoArray[indexPath.row]
            
        }
        
        cell!.textLabel?.text = imageArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var video: SearchVideo
        
        if (searchController.active){ //CHANGE FROM tableView == self.searchDisplayController?.searchResultsTableView TO searchController.active !!!
            
            video = self.filteredVideo[indexPath.row]
            
        }else{
            
            video = self.searchVideoArray[indexPath.row]
            
        }
        
        print(video.name)
    }
    
    
    //MARK: -Search
    
    func filterContentForSearchText(searchText: String, scope: String = "Title")
    {
        self.filteredVideo = self.searchVideoArray.filter({(video : SearchVideo) -> Bool in
            
            let categoryMatch = (scope == "Title")
            let stringMatch = video.name.rangeOfString(searchText)
            
            return categoryMatch && (stringMatch != nil)
            
        })
    }
    
    func searchDisplayController(controller: UISearchController, shouldReloadTableForSearchString searchString: String!) -> Bool { //CHANGE FROM UISearchDisplayController TO UISearchController !!!
        
        self.filterContentForSearchText(searchString, scope: "Title")
        
        return true
        
    }
    
    func searchDisplayController(controller: UISearchController, shouldReloadTableForSearchScope searchOption: Int) -> Bool { //CHANGE FROM UISearchDisplayController TO UISearchController !!!
        
        self.filterContentForSearchText(self.searchController!.searchBar.text!, scope: "Title") //CHANGE FROM searchDisplayController TO searchController !!!
        
        return true
        
    }
}
