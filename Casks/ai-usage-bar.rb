cask "ai-usage-bar" do
  version "1.0.3"
  sha256 "41eaeb7e121ae9ba1dce66ab676bc253f93874cc4d4d6adfc1def83438ee2834"

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

  zap trash: "~/Library/Preferences/com.reaktor.aiusagebar.plist"
end
