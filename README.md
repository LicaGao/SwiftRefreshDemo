# SwiftRefreshDemo
### 11月29日练习（补）
* 下拉刷洗控件UIRefreshControl的基本使用。
* 设置两个保存Emoji表情的数组：
```
    var emojiArray = ["🐶","🐱","🐭","🐰","🐼","🐷","🐵","🦄","🐔","🐮"]
    let refreshEmojiArray = ["😀😀😀","😂😂😂","😘😘😘","😎😎😎","🙄🙄🙄"]
```
其中第一个数组是tableView默认显示的数据，第二个则是提供给刷新方法使用：
```
    @objc func refreshAction() {
        let arcCount = UInt32(self.refreshEmojiArray.count)
        let arc = Int(arc4random() % arcCount)
        self.emojiArray.insert(refreshEmojiArray[arc], at: 0)
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
```
使用arc4random()方法生成随机数作为数组2的下标，并将对应的字符串添加到数组1的最开始位置（方便观察刷新效果）。
