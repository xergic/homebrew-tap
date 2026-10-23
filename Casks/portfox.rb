cask "portfox" do
  version "1.5.0"
  sha256 "cdb492eb46b75fbc210c4ad75bcffe51397770bdd66e1ac1443c190b033c889d"

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
