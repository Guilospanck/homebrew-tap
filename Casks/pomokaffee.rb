cask "pomokaffee" do
  version "0.2.0"
  sha256 "43a52b79c8640fb5ae34f2b9178d3d64ec6dbc6cdcd9c4a8928f1ed8b368c388"

  url "https://github.com/Guilospanck/pomokaffee/releases/download/v#{version}/Pomokaffee-#{version}.zip"
  name "Pomokaffee"
  desc "Menu-bar Pomodoro timer that quiets Slack and Focus and keeps the machine awake"
  homepage "https://github.com/Guilospanck/pomokaffee"

  depends_on macos: :sonoma

  app "Pomokaffee.app"

  # App is ad-hoc signed (not notarized): clear the download quarantine
  # so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pomokaffee.app"]
  end

  zap trash: [
    "~/Library/Logs/Pomokaffee.log",
    "~/Library/Preferences/com.guilospanck.pomokaffee.plist",
  ]
end
