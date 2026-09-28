# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.16.0/veto_0.16.0_darwin_amd64.tar.gz"
      sha256 "c23dfae1878e6e92573d63e09a36962ab8be19544a4453aadbb1187964b7a8fb"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.16.0/veto_0.16.0_darwin_arm64.tar.gz"
      sha256 "06984464b10d220b5db27edbef33d1c02031b64c82c369cdf1026ba77f4812ca"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.16.0/veto_0.16.0_linux_amd64.tar.gz"
      sha256 "c1ee7f810226c3e4ea787d153e520173728d22e80719c5953d62811b2fcf6951"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.16.0/veto_0.16.0_linux_arm64.tar.gz"
      sha256 "ec483887b1c5d532b4c658a6c31adaddf4c56ef9765ebe9dfa3b1436bd4f00df"

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
