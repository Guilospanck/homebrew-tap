cask "ai-usage-bar" do
  version "1.1.0"
  sha256 "d052aa806f51a0979c7e7b579d8d0f6a622631764173d5e24ce4d197923defa0"

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
