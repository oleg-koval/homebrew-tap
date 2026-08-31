# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.0/veto_0.8.0_darwin_amd64.tar.gz"
      sha256 "a390a9ab469e587c500d64174b1f652c2377764d5af7013ae2de18b8aea5ae5e"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.0/veto_0.8.0_darwin_arm64.tar.gz"
      sha256 "872e6a046b1a6e4d8579085148b332c027b1b75f7d395a454158100088ea4564"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.0/veto_0.8.0_linux_amd64.tar.gz"
      sha256 "41c87a8c4360ab883445988969f1598aaca88c1db47ae18dd5a73e6c8b680c5e"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.0/veto_0.8.0_linux_arm64.tar.gz"
      sha256 "961da37694729ad5e8b15ab9fa227a65e3ff8576a2d3375b00d02673bc5f4ba5"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  def post_install
    return unless OS.mac?

    executable = bin/"veto"
    return unless quiet_system "/usr/bin/xattr", "-p", "com.apple.quarantine", executable

    executable.chmod 0755
    system "/usr/bin/xattr", "-d", "com.apple.quarantine", executable
    executable.chmod 0555
  end

  test do
    assert_match "veto #{version}", shell_output("#{bin}/veto version")
  end
end
