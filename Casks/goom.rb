cask "goom" do
  version "0.3.0"
  sha256 "cd1d1770fc0dcb21b1e5f415c1d265169f96ea4df361963a82011d688bf05cae"

  url "https://github.com/Guilospanck/goom/releases/download/v#{version}/Goom-#{version}.zip"
  name "Goom"
  desc "Menu-bar screen recorder"
  homepage "https://github.com/Guilospanck/goom"

  depends_on macos: :sequoia

  app "Goom.app"

  # App is ad-hoc signed (not notarized): clear the download quarantine
  # so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Goom.app"]
  end

  zap trash: "~/Library/Preferences/com.guilospanck.goom.plist"
end
