# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.1/veto_0.14.1_darwin_amd64.tar.gz"
      sha256 "e31bc0af2385973b67d131590e427eff78024cb510caf57c233f7c31dd0e8133"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.1/veto_0.14.1_darwin_arm64.tar.gz"
      sha256 "1675f68987bb82eed7d21a74642115cd6a86c5c73be2561c83e64346840a7165"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.1/veto_0.14.1_linux_amd64.tar.gz"
      sha256 "99df388deb748c996142e9b2da3ce6040f6973c1f2e4205dfb63f99c73a9c36c"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.1/veto_0.14.1_linux_arm64.tar.gz"
      sha256 "9fce40a32ae8a5f07384b0e3eb37ff90d8c2a11a0beee9ca5a9692ff44aedf12"

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
