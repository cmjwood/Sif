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
    
    var searchVideoArray = [SearchVideo]()
    var filteredVideo = [SearchVideo]()
    var searchController:UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchVideoArray += [SearchVideo(name: "Happy")]
        self.searchVideoArray += [SearchVideo(name: "Sad")]
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
            
            return self.filteredVideo.count
            
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
        
        cell!.textLabel?.text = video.name
        
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
            
            var categoryMatch = (scope == "Title")
            var stringMatch = video.name.rangeOfString(searchText)
            
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
       