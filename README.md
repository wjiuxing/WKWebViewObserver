# WKWebViewObserver
WKWebViewObserver is an open-source key path observer on WKWebView. There is no deep technology but a common encapsulation. I'm glad that if you will like it or even give it a star.

### Supported KeyPaths

```swift
public enum WKWebViewKVOKeyPath: String {
    case estimatedProgress = "estimatedProgress"
    case canGoBack = "canGoBack"
    case canGoForward = "canGoForward"
    case contentSize = "scrollView.contentSize"
    case loading = "loading"
    case title = "title"
    case URL = "URL"

    static var allCases: [WKWebViewKVOKeyPath] {
        return [.estimatedProgress, .canGoBack, .canGoForward, .contentSize, .loading, .title, .URL]
    }

    var others: [WKWebViewKVOKeyPath] {
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

        // FIXME: DON'T forget to use the weak-strong dancing in the event closure to avoid retain cycle.
        webViewObserver = WKWebViewObserver(webView: webView)
            .onChangeEstimatedProgress { /*[weak self]*/ observer, progress in
                print("progress: \(progress)")

                if progress >= 1.0 {
                    print("progress: \(progress) -- completed.")
                }
            }.onChangeCanGoBack { /*[weak self]*/ observer, can in
                print("canGoBack: \(can)")
            }.onChangeCanGoForward { /*[weak self]*/ observer, can in
                print("canGoForward: \(can)")
            }.onChangeContentSize { /*[weak self]*/ observer, size in
                print("contentSize: \(size)")
            }.onChangeLoading { /*[weak self]*/ observer, loading in
                print("loading: \(loading)")
            }.onChangeTitle { /*[weak self]*/ observer, title in
                print("title: \(title)")
            }.onChangeURL { /*[weak self]*/ observer, url in
                print("url: \(url)")
            }
    }
    ......
}
```

## Author
**Jiuxing Wang** *email: wangjiuxing2010@hotmail.com*

## License
WKWebViewObserver is released under MIT license. See LICENSE for details.
