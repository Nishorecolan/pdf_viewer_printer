import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  
    let dartDefinesString = Bundle.main.infoDictionary?["DART_DEFINES"] as? String
    var dartDefinesDictionary = [String: String]()
    if let dartDefinesString = dartDefinesString {
        let definedValues = dartDefinesString.components(separatedBy: ",")
        for definedValue in definedValues {
            if let decoded = String(data: Data(base64Encoded: definedValue)!, encoding: .utf8) {
                let values = decoded.components(separatedBy: "=")
                dartDefinesDictionary[values[0]] = values[1]
            }
        }
    }
    let apiKey = dartDefinesDictionary["API_KEY"]
      print(dartDefinesDictionary["API_KEY"]!);
        showToastMessage(message: "From Native iOS :==> \(dartDefinesDictionary["MDL_CLIENT_ID"]!)")
  //  showToastMessage(message: "From Native iOS :==> \(apiKey!)")
  
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func showToastMessage(message: String) {
            DispatchQueue.main.async {
                if let rootViewController = self.window?.rootViewController {
                    rootViewController.view.makeToast(message: message)
                }
            }
        }
}

extension UIView {
    func makeToast(message: String, duration: TimeInterval = 5.0) {
        let toastLabel = UILabel(frame: CGRect(x: self.frame.size.width/2-150 , y: self.frame.size.height-100, width: 280, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.addSubview(toastLabel)
        UIView.animate(withDuration: duration, delay: 0.3, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in 
            toastLabel.removeFromSuperview()
        })
    }
}
