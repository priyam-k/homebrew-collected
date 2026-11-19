# The Homebrew formula for collected-cli. This file is the template; `scripts/bump-formula.mjs <version>` rewrites
# `url` and `sha256` from the tarball npm published, and the release workflow pushes the result to the tap
# (github.com/priyam-k/homebrew-collected). Users: `brew install priyam-k/collected/collected-cli`.
class CollectedCli < Formula
  desc "Command-line client for collected, the self-hosted student dashboard"
  homepage "https://collected.priyamkabra.com"
  url "https://registry.npmjs.org/collected-cli/-/collected-cli-1.7.2.tgz"
  sha256 "b7fe6a656740b0618bdbf0c978a5996d296503e7c1b9b1eedf4acc6c21fd7471"
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
