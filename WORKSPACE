# git_repository(
#     name = "build_bazel_rules_nodejs",
#     remote = "https://github.com/bazelbuild/rules_nodejs.git",
#     tag = "0.4.0", # check for the latest tag when you install
# )

git_repository(
  name = "org_dropbox_rules_node",
  remote = "https://github.com/dropbox/rules_node",
  commit = "4fe6494f3f8d1a272d47d32ecc66698f6c43ed09"
)

# load("@build_bazel_rules_nodejs//:defs.bzl", "node_repositories", "npm_install")
# # NOTE: this rule installs nodejs, npm, and yarn, but does NOT install
# # your npm dependencies into your node_modules folder.
# # You must still run the package manager to do this.
# node_repositories(package_json = ["//:package.json"])
# npm_install(
#     name = "noodles",
#     # This can also take package.json
#     package_json = "//:package.json",
# )

load("@org_dropbox_rules_node//node:defs.bzl", "node_repositories", "NODEJS_BUILD_FILE_CONTENT")
node_repositories(omit_nodejs=True)

new_http_archive(
  name = "nodejs",
  url = "https://nodejs.org/dist/v6.11.1/node-v6.11.1-darwin-x64.tar.gz",
  strip_prefix = "node-v6.11.1-darwin-x64",
  sha256 = "a2b839259089ef26f20c17864ff5ce9cd1a67e841be3d129b38d288b45fe375b",
  build_file_content = NODEJS_BUILD_FILE_CONTENT,
)
