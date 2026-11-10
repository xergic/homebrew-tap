cask "portfox" do
  version "1.7.0"
  sha256 "b30a53e2d19cfa7f7dde837f8e938de7d1f074aa6aaef533f94761816aaf48cc"

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
