cask "portfox" do
  version "1.6.0"
  sha256 "324b04aebe667e8928f009656d3ee9a403fda43e56dd66162b9d1fe229c1d333"

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
