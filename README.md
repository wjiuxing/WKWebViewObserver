# WKWebViewObserver
WKWebViewObserver is an open-source key path observer on WKWebView. There is no deep technology but a common encapsulation. I'm glad that if you will like it or even give it a star.

Now WKWebViewObserver supports Swift 5.0.

### Supported KeyPaths

```swift
public enum WKWebViewKVOKeyPath: String, CaseIterable {
    case estimatedProgress = "estimatedProgress"
    case canGoBack = "canGoBack"
    case canGoForward = "canGoForward"
    case contentSize = "scrollView.contentSize"
    case loading = "loading"
    case title = "title"
    case URL = "URL"

    public var others: [WKWebViewKVOKeyPath] {
        return WKWebViewKVOKeyPath.allCases.filter { $0 != self }
    }
}
```

### Example

``` swift
class ViewController: UIViewController {

    var webView: WKWebView!
    var webViewObserver: WKWebViewObserver!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)

        webViewObserver = WKWebViewObserver(webView: webView)
            .onChangeEstimatedProgress { observer, progress in
                print("progress: \(progress)")

                if progress >= 1.0 {
                    print("progress: \(progress) -- completed.")
                }
            }.onChangeCanGoBack { observer, can in
                print("canGoBack: \(can)")
            }.onChangeCanGoForward { observer, can in
                print("canGoForward: \(can)")
            }.onChangeContentSize { observer, size in
                print("contentSize: \(size)")
            }.onChangeLoading { observer, loading in
                print("loading: \(loading)")
            }.onChangeTitle { observer, title in
                print("title: \(title)")
            }.onChangeURL { observer, url in
                print("url: \(url)")
            }
    }
    ......
}
```

## Author
**Jiuxing Wang** *email: [wangjiuxing2010@hotmail.com](mailto:wangjiuxing2010@hotmail.com)*

## License
WKWebViewObserver is released under MIT license. See LICENSE for details.
