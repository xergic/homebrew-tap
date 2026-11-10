cask "localfox" do
  version "1.6.0"
  sha256 "24572bf9a9c4fbfea2c6e89e1a88b195f7f6819c432b5b58c59f9b474078f6b2"

  url "https://github.com/xergic/localfox/releases/download/v#{version}/Localfox-#{version}.dmg"
  name "Localfox"
  desc "Menu bar app that runs local dev servers behind HTTPS .localhost domains"
  homepage "https://github.com/xergic/localfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Localfox.app"

  uninstall launchctl: "net.kandera.Localfox.helper",
            quit:      "net.kandera.Localfox"

  # The root CA is trusted in the login keychain. Only zap removes it, because
  # brew upgrade runs uninstall and a re-trust asks for a password.
  zap script: {
        executable: "/bin/sh",
        args:       [
          "-c",
          "security find-certificate -a -c 'Localfox Local Authority' -Z \"$1\" " \
          "| awk '/^SHA-256 hash:/ {print $3}' " \
          "| while read -r hash; do security delete-certificate -t -Z \"$hash\" \"$1\"; done",
          "sh",
          "#{Dir.home}/Library/Keychains/login.keychain-db",
        ],
      },
      trash:  [
        "/Library/Application Support/Localfox",
        "~/Library/Application Support/Localfox",
        "~/Library/Caches/net.kandera.Localfox",
        "~/Library/HTTPStorages/net.kandera.Localfox",
        "~/Library/Preferences/net.kandera.Localfox.plist",
      ]
end
