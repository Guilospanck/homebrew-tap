cask "ai-usage-bar" do
  version "1.0"
  sha256 "60a4309c759187afa7c6c576a66e61261481ce55b19cb4cf92070af39f31f4e6"

  url "https://github.com/Guilospanck/ai-usage-bar/releases/download/v#{version}/AI-Usage-Bar-#{version}.zip"
  name "AI Usage Bar"
  desc "Menu-bar app showing Claude/Codex usage"
  homepage "https://github.com/Guilospanck/ai-usage-bar"

  depends_on macos: ">= :ventura"

  app "AI Usage Bar.app"

  # App is ad-hoc signed (not notarized): clear the download quarantine
  # so Gatekeeper lets it launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AI Usage Bar.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.reaktor.aiusagebar.plist",
  ]
end
