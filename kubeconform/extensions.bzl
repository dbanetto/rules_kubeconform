load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")  # a repo rule
load("//kubeconform/private/rules:import.bzl", "kubeconform_import")
load("//kubeconform:repositories.bzl", "kubeconform_register_toolchains")

def _kubeconform_impl(ctx):

  # collect artifacts from across the dependency graph
  toolchains = []
  schema_imports = []
  for mod in ctx.modules:
    if len(mod.tags.toolchain) > 0 and not mod.is_root:
      fail("Toolchain being set in non-root module")
    elif mod.is_root:
        for chain in mod.tags.toolchain:
            toolchains.append(chain)
    
    for schema_import in mod.tags.schema_import:
        schema_imports.append(schema_import)
      


  for schema_import in schema_imports:
      kubeconform_import(
        name = schema_import.name,
        github_repo = schema_import.github_repo,
        commit = schema_import.commit,
        kube_version = schema_import.kube_version,
        resources = schema_import.resources,
      )

  for toolchain in toolchains:
    # call repo rules to generate repos
    kubeconform_register_toolchains(
        name = "kubeconform_{}".format(toolchain.version.replace(".","_")),
        kubeconform_version = toolchain.version,
        register = False
    )


_toolchain = tag_class(attrs = {"version": attr.string() })

_import = tag_class(attrs = {
    "name": attr.string(
        doc = "Name of the resulting repository",
        mandatory = True,
    ),
    "github_repo": attr.string(
        doc = "GitHub repo name.",
        mandatory = True,
    ),
    "commit": attr.string(
        doc = "Commit.",
        mandatory = True,
    ),
    "kube_version": attr.string(
        doc = "Kubernetes version.",
        mandatory = True,
    ),
    "resources": attr.string_list_dict(
        doc = "Resource schemas to import.",
        mandatory = True,
    ),
})

kubeconform = module_extension(
  implementation = _kubeconform_impl,
  tag_classes = {"toolchain": _toolchain, "schema_import": _import},
)
