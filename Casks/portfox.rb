cask "portfox" do
  version "1.7.1"
  sha256 "e95ed06edc965ae2c37cdfb27a9e59587bb884cae4b1ed757a259b2c1d9507db"

  url "https://github.com/xergic/portfox/releases/download/v#{version}/Portfox-#{version}.dmg"
  name "Portfox"
  desc "Menu bar app that lists local dev servers and stops them"
  homepage "https://github.com/xergic/portfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Portfox.app"

  uninstall quit: "net.kandera.Portfox"

  zap trash: [
    "~/Library/Caches/net.kandera.Portfox",
    "~/Library/HTTPStorages/net.kandera.Portfox",
    "~/Library/Preferences/net.kandera.Portfox.plist",
  ]
end
