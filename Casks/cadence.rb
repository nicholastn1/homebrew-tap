# Template for nicholastn1/homebrew-tap. release.sh fills in 0.2.0 and 5a00122392663b330622b4631b14949ad51e61e1f343257106ab94cd492a1f25.
cask "cadence" do
  version "0.2.0"
  sha256 "5a00122392663b330622b4631b14949ad51e61e1f343257106ab94cd492a1f25"

  url "https://github.com/nicholastn1/cadence/releases/download/v#{version}/Cadence-#{version}.zip"
  name "Cadence"
  desc "Teleprompter in the MacBook notch that scrolls at the pace you speak"
  homepage "https://github.com/nicholastn1/cadence"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Cadence.app"

  # Not notarized yet: drop the quarantine flag so Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Cadence.app"]
  end

  zap trash: "~/Library/Preferences/io.github.nicholastn1.cadence.plist"
end
