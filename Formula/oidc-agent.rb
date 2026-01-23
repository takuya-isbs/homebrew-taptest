# ORIGINAL: https://github.com/indigo-dc/homebrew-oidc-agent/blob/master/Formula/oidc-agent.rb

class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.3.4.tar.gz"
  sha256 "21d670851df8a726a9a8e620ec4557c3fd9cc490a06a57ddddfc5a9bdc8f9df0"
  license "MIT"

  bottle do
    root_url "https://github.com/takuya-isbs/homebrew-taptest/releases/download/oidc-agent-5.3.4"
    sha256 arm64_tahoe:   "0347f7ebd95b69990392bbbb61f1719777146273a1e0794dc6f8a1d8e05de5ee"
    sha256 arm64_sequoia: "d923ec4a01181f97e35a0f73747993734081b0005053426e60a9f652c1ac2d43"
  end

  depends_on "help2man" => :build
  depends_on "argp-standalone"
  depends_on "jq"
  depends_on "libmicrohttpd"
  depends_on "libsodium"
  depends_on :macos # macOS only
  depends_on "pkg-config"
  depends_on "qrencode"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  service do
    run [opt_bin/"oidc-agent", "-a", "~/Library/Caches/oidc-agent/oidc-agent.sock", "-d"]
    keep_alive true
    working_dir var
    log_path var/"log/oidc-agent.log"
    error_log_path var/"log/oidc-agent.log"
    environment_variables PATH: "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/homebrew/bin"
  end

  def caveats
    <<~EOS
      To start oidc-agent as a background service now and restart at login:
        brew services start oidc-agent
      If you don't need a background service, you can run the following instead:
        oidc-agent -a ~/Library/Caches/oidc-agent/oidc-agent.sock -d
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oidc-agent --version")
  end
end
