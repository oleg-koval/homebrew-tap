# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.1.0/veto_0.1.0_darwin_amd64.tar.gz"
      sha256 "12c791d330e1fad6ed1f75414332be1e0150a625d76f5035dea42a6a4e551967"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.1.0/veto_0.1.0_darwin_arm64.tar.gz"
      sha256 "e7470730db8b526aa3f9cd46c42bfcf490d858b294802152d4c893dfa878efc4"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.1.0/veto_0.1.0_linux_amd64.tar.gz"
      sha256 "1abe1cd10205c2f87fb20a62b696d701fb3aea667884b8d33bd9109866da80f5"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.1.0/veto_0.1.0_linux_arm64.tar.gz"
      sha256 "fc15414a9cbd659571c9894d49a422c17d4059ad97443cea3e59f30d385defe8"

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
