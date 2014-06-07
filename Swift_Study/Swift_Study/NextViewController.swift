//
//  NextViewController.swift
//  Swift_Study
//
//  Created by lichaowei on 14-6-6.
//  Copyright (c) 2014年 company. All rights reserved.
//

import UIKit

class NextViewController: UIViewController
{

    var items:NSMutableArray?;
    @IBAction func popUp(sender : UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    @IBAction func editAction(sender : UIButton) {
        self.tableView.setEditing(true, animated: true);
    }
    @IBOutlet var tableView : UITableView = nil
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.items = NSMutableArray();
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.items?.addObjectsFromArray(["","","",""]);
        self.tableView.setEditing(true, animated: true);
        
        var url:NSURL = NSURL.URLWithString("http://m.weather.com.cn/data/101110101.html");
        var request = NSURLRequest(URL:url)
        var conn = NSURLConnection(request: request, delegate:self)
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!)
    {
        println(error);
    }
    func connectionShouldUseCredentialStorage(connection: NSURLConnection!) -> Bool
    {
        return true;
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!)
    {
        println("didReceive ==\n",response);
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!)
    {
//        println(data);
        println("receiveData")
        var returnString:NSString?
        returnString = NSString(data:data,encoding:NSUTF8StringEncoding)
        println("code....\(returnString)")
    
        
    }
//        NSJSONSerialization.JSONObjectWithData(data, options: 0, error: nil);
//        var dic:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: 0, error: nil);
//        println("----- > \(dic)")
    
    func setUpTableView(){
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        println(indexPath);
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = String(format: "%i", indexPath.row+1)
        return cell
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if indexPath.row == 0
        {
            self.items?.addObject(0);
            self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left);
            
        }else
        {
            self.items?.removeObjectAtIndex(indexPath.row)
            self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        }
//        self.tableView.reloadData();
    }
    
    func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle
    {
        if indexPath.row == 0{
           return (UITableViewCellEditingStyle.Insert)
        }
        return (UITableViewCellEditingStyle.Delete)
    }
    
    func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
    {
        self.tableView?.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
        self.items?.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
