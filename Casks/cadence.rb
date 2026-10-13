# Template for nicholastn1/homebrew-tap. release.sh fills in 0.5.3 and adc151ae9a948b051558a7372bab5c05df6227cbd3bcb78e038836e4c7b0631b.
cask "cadence" do
  version "0.5.3"
  sha256 "adc151ae9a948b051558a7372bab5c05df6227cbd3bcb78e038836e4c7b0631b"

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
