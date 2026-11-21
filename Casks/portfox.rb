cask "portfox" do
  version "1.8.1"
  sha256 "9d844bf9fae0ac8484ba0d625411b0c268825857cd90488504c1905bb4bf5f3c"

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
