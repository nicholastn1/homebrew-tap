# Template for nicholastn1/homebrew-tap. release.sh fills in 0.3.1 and 9b884015a0d5367a5079d5b855514646c6d2498a754ea316bec7f0f451d21a3b.
cask "cadence" do
  version "0.3.1"
  sha256 "9b884015a0d5367a5079d5b855514646c6d2498a754ea316bec7f0f451d21a3b"

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
