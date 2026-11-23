import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var view: GameView!

    func applicationDidFinishLaunching(_ notification: Notification) {
        buildMenu()
        let scale: CGFloat = 3
        let size = NSSize(width: CGFloat(Screen.width) * scale, height: CGFloat(Screen.height) * scale)
        window = NSWindow(contentRect: NSRect(origin: .zero, size: size),
                          styleMask: [.titled, .closable, .miniaturizable, .resizable],
                          backing: .buffered, defer: false)
        window.title = "Thrust"
        window.contentAspectRatio = size
        window.backgroundColor = .black
        view = GameView(frame: NSRect(origin: .zero, size: size))
        window.contentView = view
        window.center()
        window.makeKeyAndOrderFront(nil)
        window.makeFirstResponder(view)
        window.collectionBehavior = [.fullScreenPrimary]
        NSApp.activate(ignoringOtherApps: true)
        view.start()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }

    private func buildMenu() {
        let main = NSMenu()
        let appItem = NSMenuItem()
        main.addItem(appItem)
        let appMenu = NSMenu()
        appMenu.addItem(withTitle: "About Thrust", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
        appMenu.addItem(.separator())
        appMenu.addItem(withTitle: "Quit Thrust", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        appItem.submenu = appMenu

        let viewItem = NSMenuItem()
        main.addItem(viewItem)
        let viewMenu = NSMenu(title: "View")
        let fs = NSMenuItem(title: "Toggle Full Screen", action: #selector(NSWindow.toggleFullScreen(_:)), keyEquivalent: "f")
        fs.keyEquivalentModifierMask = [.command, .control]
        viewMenu.addItem(fs)
        let crt = NSMenuItem(title: "Scanlines", action: #selector(GameView.toggleScanlines(_:)), keyEquivalent: "l")
        viewMenu.addItem(crt)
        viewItem.submenu = viewMenu
        NSApp.mainMenu = main
    }
}
