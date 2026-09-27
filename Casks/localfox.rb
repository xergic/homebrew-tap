cask "localfox" do
  version "1.0.0"
  sha256 "650ce214a25495eb8f667552f981adc200b60e95460e34a46b738ee36c73eb5b"

  url "https://github.com/xergic/localfox/releases/download/v#{version}/Localfox-#{version}.dmg"
  name "Localfox"
  desc "Menu bar app that runs local dev servers behind HTTPS .localhost domains"
  homepage "https://github.com/xergic/localfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Localfox.app"

  uninstall launchctl: "net.kandera.Localfox.helper",
            quit:      "net.kandera.Localfox"

  # The root CA is trusted in the System keychain. Only zap removes it, because
  # brew upgrade runs uninstall and a re-trust asks for an admin password.
  zap script: {
        executable: "/bin/sh",
        args:       [
          "-c",
          "security find-certificate -a -c 'Localfox Local Authority' -Z \"$1\" " \
          "| awk '/^SHA-256 hash:/ {print $3}' " \
          "| while read -r hash; do security delete-certificate -Z \"$hash\" \"$1\"; done",
          "sh",
          "/Library/Keychains/System.keychain",
        ],
        sudo:       true,
      },
      trash:  [
        "/Library/Application Support/Localfox",
        "~/Library/Application Support/Localfox",
        "~/Library/Preferences/net.kandera.Localfox.plist",
      ]
end
