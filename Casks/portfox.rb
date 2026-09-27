cask "portfox" do
  version "1.0.0"
  sha256 "fcb19cc9e0ec0a4c186f3b718f711c8ea5fa202f384d9835657cfaa5656308c9"

  url "https://github.com/xergic/portfox/releases/download/v#{version}/Portfox-#{version}.dmg"
  name "Portfox"
  desc "Menu bar app that lists local dev servers and stops them"
  homepage "https://github.com/xergic/portfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Portfox.app"

  uninstall quit: "net.kandera.Portfox"

  zap trash: "~/Library/Preferences/net.kandera.Portfox.plist"
end
