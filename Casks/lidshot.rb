cask "lidshot" do
  version "1.4.0"
  sha256 "21bd7bb76cf96a2a61474e499a953a4e4390267e2b7a4ef9b975185c1754e589"

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
