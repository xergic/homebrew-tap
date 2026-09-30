cask "portfox" do
  version "1.1.1"
  sha256 "ff116ea887d7a88e102445c98c6ee0ce1a3d6ef790bbb82edea204fcec68bcfd"

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
