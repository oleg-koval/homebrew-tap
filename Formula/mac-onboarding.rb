class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.8"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.8/mac-onboarding-darwin-arm64"
    sha256 "7cea68a33ca8f237fad61abea215a61903b761d159c9c7db2e9ad975d75a54b6"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.8/mac-onboarding-darwin-amd64"
    sha256 "417ac160686d873ee7f76343a2fd62be858ec6d1dd4844ffbbd5641c1f6b8cdb"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
