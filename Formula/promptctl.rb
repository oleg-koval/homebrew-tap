# typed: false
# frozen_string_literal: true

class Promptctl < Formula
  desc "CLI toolkit that transforms raw ideas into structured, optimized prompts"
  homepage "https://github.com/oleg-koval/promptctl"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/oleg-koval/promptctl/releases/download/v0.2.0/promptctl_0.2.0_Darwin_x86_64.tar.gz"
      sha256 "21813fa67aa64ff31e2a968c5ff09d52253f3ecbba858ffd53c34f983f551114"
    end
    on_arm do
      url "https://github.com/oleg-koval/promptctl/releases/download/v0.2.0/promptctl_0.2.0_Darwin_arm64.tar.gz"
      sha256 "d11fefc66bb43ae5c5ac52d3821a952b40dbdd26cbb23161ea29751cb72fb2c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oleg-koval/promptctl/releases/download/v0.2.0/promptctl_0.2.0_Linux_x86_64.tar.gz"
      sha256 "e2c556ae0a59d8debff39fa2480553768e9cdd70b1018a52a68affd5f9296126"
    end
    on_arm do
      url "https://github.com/oleg-koval/promptctl/releases/download/v0.2.0/promptctl_0.2.0_Linux_arm64.tar.gz"
      sha256 "fb345ceb251e75fc1d1816808de3c95a4301def7157fea34e468da9319a963dd"
    end
  end

  def install
    bin.install "promptctl"
  end

  test do
    assert_match "promptctl v#{version}", shell_output("#{bin}/promptctl version")
  end
end
