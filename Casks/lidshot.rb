cask "lidshot" do
  version "1.6.0"
  sha256 "84b3e4270d97c18143ec11ed86d409c20aad80f898caefdc68dcd990d211f8f6"

  url "https://github.com/Extrik808/LidShot/releases/download/v#{version}/LidShot-#{version}.zip"
  name "LidShot"
  desc "Keep a MacBook awake with the lid closed and annotate screenshots"
  homepage "https://github.com/Extrik808/LidShot"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "LidShot.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/LidShot.app"]
  end

  uninstall quit: "com.extrik808.lidshot"

  zap trash: "~/Library/Preferences/com.extrik808.lidshot.plist"
end
