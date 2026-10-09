cask "ai-usage-bar" do
  version "1.0.6"
  sha256 "627f596ab2dd78142f05cad7d9ba2955d6ff480944df85932031fcbfa05d924f"

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

  zap trash: "~/Library/Preferences/com.guilospanck.aiusagebar.plist"
end
