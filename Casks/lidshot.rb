cask "lidshot" do
  version "1.5.0"
  sha256 "4370ce67a7c46384c9142ca6a50f74bae35787966ede794611b7e6943b4635b3"

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
