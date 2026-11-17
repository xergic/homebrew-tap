cask "portfox" do
  version "1.8.0"
  sha256 "0a8a663f272e709ddc44b9ae0ae595e5d1a2b76d975e4f64a6e748330f3a18c2"

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
