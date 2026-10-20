cask "lidshot" do
  version "1.1.0"
  sha256 "be94c21a97312db5fdf7c30ea084b51aef19d9947b2630d7dded18ef1bcd5313"

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
