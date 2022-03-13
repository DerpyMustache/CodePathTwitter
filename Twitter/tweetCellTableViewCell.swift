//
//  tweetCellTableViewCell.swift
//  Twitter
//
//  Created by Mo Kranwinkel on 3/3/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class tweetCellTableViewCell: UITableViewCell {

    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { Error in
            print("Error in retweeting \(Error)")
        })
    }
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    @IBAction func favTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { Error in
                print("Favorite did not succeed: \(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { Error in
                print("Unfavorite did not succeed: \(Error)")
            })
        }
    }
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var favorited = false
    var tweetId = -1 
    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)

        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
