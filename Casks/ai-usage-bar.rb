cask "ai-usage-bar" do
  version "1.0.5"
  sha256 "e4a123cbe493cf4d3b91c5a52fd34db17eff462a845e14ad2356f66800c5f090"

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
