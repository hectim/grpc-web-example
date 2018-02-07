def _webpack(ctx):
    args = ctx.actions.args()
    args.add(["--display-error-details"])
    args.add(["--config", ctx.file.config.path])

    ctx.actions.run(
        inputs = ctx.files.srcs + [ctx.file.config] + ctx.files.node_modules,
        executable = ctx.executable.webpack,
        outputs = [ctx.outputs.bundle],
        arguments = [args],
        env = {
            "TARGET_PATH": ctx.outputs.bundle.path,
        }
    )
    return struct()

webpack = rule(
    implementation = _webpack,
    attrs = {
        "config": attr.label(allow_files = True, single_file = True),
        "node_modules": attr.label(default = Label("//:node_modules")),
        "srcs": attr.label_list(allow_files = True),
        "webpack": attr.label(
            default = "//bazelisk:webpack",
            executable = True,
            cfg = "host"
        ),
    },
    outputs = {
        "bundle": "www"
    },
)

# not being used currently, but wanted to have a copy
