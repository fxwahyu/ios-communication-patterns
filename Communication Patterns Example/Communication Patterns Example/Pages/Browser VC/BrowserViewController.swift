//
//  Game2ViewController.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 18/07/24.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private let BROWSER_URL: String = "https://google.com"
    var duration: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebview()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimer(_:)), name: NSNotification.Name(NotificationName.Name.TIMER.rawValue), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func loadWebview() {
        webview.navigationDelegate = self
        if let request = URL(string: BROWSER_URL) {
            webview.load(URLRequest(url: request))
        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        loading.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
    
    @objc func updateTimer(_ notification: Notification) {
        let duration = notification.userInfo?["timer"] as? Int ?? 0
        self.durationLabel.text = setTimerString(number: duration)
    }
}
