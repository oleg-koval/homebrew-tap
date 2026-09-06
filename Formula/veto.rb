# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.1/veto_0.10.1_darwin_amd64.tar.gz"
      sha256 "189c0dfe81fa290aeebe6d72b114ca2256e056468987a3aa68928aa4ec708b3c"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.1/veto_0.10.1_darwin_arm64.tar.gz"
      sha256 "fbe9436d2a56dd98525e5e051326ec8e794ee5b7f51c32fdf9a78c507b786fd5"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.1/veto_0.10.1_linux_amd64.tar.gz"
      sha256 "4f757be9ebd4eb71b20223e2d20272d811315fc6f3e5dac216d7b2ca356a26da"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.1/veto_0.10.1_linux_arm64.tar.gz"
      sha256 "f4b21874bfcf27895368b1c6ced01b12d14733c91c767513694e2e5541d0062a"

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
