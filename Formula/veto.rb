# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.4/veto_0.10.4_darwin_amd64.tar.gz"
      sha256 "d0019b85644b0bce67c402619b8ec6415c9db05fd9b31efeb446e09bfa5dcd39"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.4/veto_0.10.4_darwin_arm64.tar.gz"
      sha256 "0442e9935de38ef7b7f25721d6a74c67605478d8a854704383f36612d2d2bc44"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.4/veto_0.10.4_linux_amd64.tar.gz"
      sha256 "02d3b83a25a90ae0911400052c3a85d1de0662697525b887d2d2849e62a3aedc"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.4/veto_0.10.4_linux_arm64.tar.gz"
      sha256 "bab308113800c6663db44764a3be6935a6db59d97522df1e264ef461bb3e36b3"

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
