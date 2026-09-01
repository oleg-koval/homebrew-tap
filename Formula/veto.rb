# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.1/veto_0.8.1_darwin_amd64.tar.gz"
      sha256 "3453649fcececfef02bce68d8b1575b4f235995bd03a8a79beabe6718e4f6ef5"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.1/veto_0.8.1_darwin_arm64.tar.gz"
      sha256 "d608aa2858877b7394f53933f5255c0069539fc541e1503fe8076b8bb23d0052"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.1/veto_0.8.1_linux_amd64.tar.gz"
      sha256 "45e0db8aa3bc5f773d0590c3092996577aaa1d62b3a6ac4326417ebd5e5c59b3"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.8.1/veto_0.8.1_linux_arm64.tar.gz"
      sha256 "463eb28d017afc723936a23525fdf711d2d3876e0223f22b808b9bb3997d6d87"

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
