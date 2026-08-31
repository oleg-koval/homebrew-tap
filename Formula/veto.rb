# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.2/veto_0.6.2_darwin_amd64.tar.gz"
      sha256 "a6e8aea2006c3e050590e267a3efcdd5ae4f57c2b677e322d77455d037ba7429"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.2/veto_0.6.2_darwin_arm64.tar.gz"
      sha256 "ba0d659e2ac494ef39bb7051e22016941b6ebf824ec423f76e3b24a0501ed5ae"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.2/veto_0.6.2_linux_amd64.tar.gz"
      sha256 "59cba57ceeeb8fd1f169b6df260040109b74930691c6f135e01ca6251361780d"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.2/veto_0.6.2_linux_arm64.tar.gz"
      sha256 "c8bf0d40d76c6cf521600a74da7605f40adbda1b9675fbd6488a461033138da0"

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
