# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.1/veto_0.4.1_darwin_amd64.tar.gz"
      sha256 "e644ef7f99c8202835592df6f4dfb320b3a909878bb76597c8f11c41505ff3bf"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.1/veto_0.4.1_darwin_arm64.tar.gz"
      sha256 "eb250c8c0e1a6f1a702e8f7ccee28b0721d516e937a91d2e260dc9a452aab184"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.1/veto_0.4.1_linux_amd64.tar.gz"
      sha256 "d7148789daae85a4bd7e99304a5aed0c77c6bf2b067d41240dcdf0cb0f2e55f2"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.4.1/veto_0.4.1_linux_arm64.tar.gz"
      sha256 "da7eb66b19a363caaa37a2f6ecdcb174c0e6082e66bd1c7619587e2f28ee55a9"

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
