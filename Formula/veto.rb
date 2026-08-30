# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.0/veto_0.4.0_darwin_amd64.tar.gz"
      sha256 "f825bf0a8f712c93c5843de866a56cb678343b1c2668a3a2d693fb81c23f323f"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.0/veto_0.4.0_darwin_arm64.tar.gz"
      sha256 "ab0cd9904ebdab78bef356f1aa15f7d63feacaec979293dd2a805fbda8d7e157"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.0/veto_0.4.0_linux_amd64.tar.gz"
      sha256 "079f593c8a456dfa0605ab0f688681fdfc49a759b4e48a7c81ef16d6a0bc2bfe"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.0/veto_0.4.0_linux_arm64.tar.gz"
      sha256 "7cb212a0478947df6d605d2d96d7c904e9599a767b43d7664234c4b24a0499f8"

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
