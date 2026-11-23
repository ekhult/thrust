import AppKit
import QuartzCore

final class GameView: NSView {
    let screen = Screen()
    let input = Input()
    private var game: Game!
    private var timer: Timer?
    private var lastTime = CACurrentMediaTime()
    private var scanlines = UserDefaults.standard.bool(forKey: "scanlines")

    override var acceptsFirstResponder: Bool { true }
    override var isFlipped: Bool { true }

    func start() {
        game = Game(screen: screen, input: input)
        wantsLayer = true
        layer?.magnificationFilter = .nearest
        layer?.backgroundColor = NSColor.black.cgColor
        let t = Timer(timeInterval: 1.0 / 120.0, repeats: true) { [weak self] _ in self?.frame() }
        RunLoop.main.add(t, forMode: .common)
        timer = t
        NotificationCenter.default.addObserver(forName: NSWindow.didResignKeyNotification, object: nil, queue: .main) { [weak self] _ in
            self?.input.releaseAll()
        }
    }

    private func frame() {
        let now = CACurrentMediaTime()
        let dt = min(0.1, now - lastTime)
        lastTime = now
        game.update(dt: dt)
        game.render()
        needsDisplay = true
    }

    override func draw(_ dirtyRect: NSRect) {
        guard let ctx = NSGraphicsContext.current?.cgContext else { return }
        ctx.setFillColor(NSColor.black.cgColor)
        ctx.fill(bounds)
        guard let img = screen.makeImage() else { return }
        // fit 320x200 into the view keeping aspect
        let sx = bounds.width / CGFloat(Screen.width), sy = bounds.height / CGFloat(Screen.height)
        let s = min(sx, sy)
        let w = CGFloat(Screen.width) * s, h = CGFloat(Screen.height) * s
        let r = CGRect(x: (bounds.width - w) / 2, y: (bounds.height - h) / 2, width: w, height: h)
        ctx.interpolationQuality = .none
        ctx.saveGState()
        ctx.translateBy(x: 0, y: bounds.height)
        ctx.scaleBy(x: 1, y: -1)
        ctx.draw(img, in: CGRect(x: r.minX, y: bounds.height - r.maxY, width: w, height: h))
        ctx.restoreGState()
        if scanlines && s >= 2 {
            ctx.setFillColor(NSColor(white: 0, alpha: 0.35).cgColor)
            var y = r.minY + s * 0.5
            while y < r.maxY {
                ctx.fill(CGRect(x: r.minX, y: y, width: w, height: max(1, s * 0.4)))
                y += s
            }
        }
    }

    @objc func toggleScanlines(_ sender: Any?) {
        scanlines.toggle()
        UserDefaults.standard.set(scanlines, forKey: "scanlines")
        needsDisplay = true
    }

    override func keyDown(with event: NSEvent) {
        if event.modifierFlags.contains(.command) { super.keyDown(with: event); return }
        input.keyDown(event)
    }
    override func keyUp(with event: NSEvent) { input.keyUp(event) }
    override func flagsChanged(with event: NSEvent) { input.flags(event) }
}
