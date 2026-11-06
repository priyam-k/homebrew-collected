# The Homebrew formula for collected-cli. This file is the template; `scripts/bump-formula.mjs <version>` rewrites
# `url` and `sha256` from the tarball npm published, and the release workflow pushes the result to the tap
# (github.com/priyam-k/homebrew-collected). Users: `brew install priyam-k/collected/collected-cli`.
class CollectedCli < Formula
  desc "Command-line client for collected, the self-hosted student dashboard"
  homepage "https://collected.priyamkabra.com"
  url "https://registry.npmjs.org/collected-cli/-/collected-cli-1.7.0.tgz"
  sha256 "f40426f596039aee4e42d849eee4188df4393f9eb54c926366d6fd582db04b1c"
  license "AGPL-3.0-only"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/collected --version")
  end
end
