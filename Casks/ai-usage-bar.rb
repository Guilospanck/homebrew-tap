cask "ai-usage-bar" do
  version "1.0.4"
  sha256 "a9da79e7f618ba5498bce9c2b2c3d116cf658dc811ecff2f128ac685ed792c0b"

  url "https://github.com/Guilospanck/ai-usage-bar/releases/download/v#{version}/AI-Usage-Bar-#{version}.zip"
  name "AI Usage Bar"
  desc "Menu-bar app showing Claude/Codex usage"
  homepage "https://github.com/Guilospanck/ai-usage-bar"

  depends_on macos: :ventura

  app "AI Usage Bar.app"

  # App is ad-hoc signed (not notarized): clear the download quarantine
  # so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/AI Usage Bar.app"]
  end

  zap trash: "~/Library/Preferences/com.reaktor.aiusagebar.plist"
end
