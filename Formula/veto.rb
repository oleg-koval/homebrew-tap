# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.0/veto_0.10.0_darwin_amd64.tar.gz"
      sha256 "a10ef86a4f2da23d971fa320365459f19eb6919ee908f00b4b63b2025852f460"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.0/veto_0.10.0_darwin_arm64.tar.gz"
      sha256 "ec9e95fe246590d2b7587492aeb60dfb2c085faa96d66da996ebc2c2ac7b835f"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.0/veto_0.10.0_linux_amd64.tar.gz"
      sha256 "a39bbefdaa061450872fd7669b9abcf2a7832c675969d9787f550f08ddec55c8"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.10.0/veto_0.10.0_linux_arm64.tar.gz"
      sha256 "e900e1a90c40aff6a8e583014403df69124cda05a49a91ec4710d686c4d51881"

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
