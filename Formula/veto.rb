# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.3/veto_0.10.3_darwin_amd64.tar.gz"
      sha256 "ee41b0fdf4a3489865274c6c5948a640123fad699987410c34f3696ee5f82576"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.3/veto_0.10.3_darwin_arm64.tar.gz"
      sha256 "1a991126b8bd4b760ad72e8fa3e7273390179b24f7d38ddf6e2543342e2c4d1d"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.3/veto_0.10.3_linux_amd64.tar.gz"
      sha256 "85fb87c1063cec84821226729c51434f3773c13fbf3e68fe17c9677ac4242ec7"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.3/veto_0.10.3_linux_arm64.tar.gz"
      sha256 "47d6db8675f1b1e093ff38b5ea710a8cee6dc26f64f49b2222b92debf82e8dc9"

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
