class JwtAgent < Formula
  desc "Obtain a JSON Web Token (JWT) from a JWT server"
  homepage "https://github.com/oss-tsukuba/jwt-agent"
  url "https://github.com/oss-tsukuba/jwt-agent/archive/refs/tags/1.1.1.tar.gz"

  # shasum -a 256
  sha256 "7b3bb160e963feed83c63018c54056643cf6eb7510a431c15c931756ba5ce4cb"

  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/takuya-isbs/homebrew-taptest/releases/download/jwt-agent-1.1.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "44e9fd35fe50c9319766cfd1682031a2f6bea3556a8848e304cc0c60746c062a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3e544a259bc85cf6f5bfb619a76bcbc90552d9e308efc48dbfbbf441017f8e65"
  end

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
  end

  test do
    system "#{bin}/jwt-agent", "--version"
  end
end
