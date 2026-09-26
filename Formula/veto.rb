# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.0/veto_0.14.0_darwin_amd64.tar.gz"
      sha256 "b267519ce55090dd6ec57f3d6c2f1f423c7769a182f0789800d3aab47a5740c5"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.0/veto_0.14.0_darwin_arm64.tar.gz"
      sha256 "e82e02e15616b90fbe1099c697c90771fe630401f8c8f857fcec96c7f6adae10"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.0/veto_0.14.0_linux_amd64.tar.gz"
      sha256 "4610a95ac159d579fc79839e791266e1290dfddaadb99bbc1cd4fb47457aa668"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.14.0/veto_0.14.0_linux_arm64.tar.gz"
      sha256 "941fe889389a86e80e2384ad9cb5cfd9c057b4721ca295c8608105475be331e6"

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
