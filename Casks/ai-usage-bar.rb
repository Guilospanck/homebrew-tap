cask "ai-usage-bar" do
  version "1.0.1"
  sha256 "57d5eaf6b03ee436b72d70759b554c9b7f695df9a889c067a298ab4fa9113876"

  url "https://github.com/Guilospanck/ai-usage-bar/releases/download/v#{version}/AI-Usage-Bar-#{version}.zip"
  name "AI Usage Bar"
  desc "Menu-bar app showing Claude/Codex usage"
  homepage "https://github.com/Guilospanck/ai-usage-bar"

  depends_on macos: :ventura

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
