cask "lidshot" do
  version "1.3.0"
  sha256 "6edd6cb5ee440b418e57c6fcb39c6478bf4a96c6f200a5ca48e8f5fe81750065"

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
