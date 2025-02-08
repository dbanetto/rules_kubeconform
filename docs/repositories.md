<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies

<a id="kubeconform_register_toolchains"></a>

## kubeconform_register_toolchains

<pre>
load("@rules_kubeconform//kubeconform:repositories.bzl", "kubeconform_register_toolchains")

kubeconform_register_toolchains(<a href="#kubeconform_register_toolchains-name">name</a>, <a href="#kubeconform_register_toolchains-register">register</a>, <a href="#kubeconform_register_toolchains-kwargs">kwargs</a>)
</pre>

Convenience macro for users which does typical setup.

- create a repository for each built-in platform like "kubeconform_linux_amd64" -
  this repository is lazily fetched when kubeconform is needed for that platform.
- TODO: create a convenience repository for the host platform like "kubeconform_host"
- create a repository exposing toolchains for each platform like "kubeconform_platforms"
- register a toolchain pointing at each platform
Users can avoid this macro and do these steps themselves, if they want more control.


**PARAMETERS**


| Name  | Description | Default Value |
| :------------- | :------------- | :------------- |
| <a id="kubeconform_register_toolchains-name"></a>name |  base name for all created repos, like "kubeconform0_4_12"   |  none |
| <a id="kubeconform_register_toolchains-register"></a>register |  <p align="center"> - </p>   |  `True` |
| <a id="kubeconform_register_toolchains-kwargs"></a>kwargs |  passed to each kubeconform_repositories call   |  none |


<a id="rules_kubeconform_dependencies"></a>

## rules_kubeconform_dependencies

<pre>
load("@rules_kubeconform//kubeconform:repositories.bzl", "rules_kubeconform_dependencies")

rules_kubeconform_dependencies()
</pre>





<a id="kubeconform_repositories"></a>

## kubeconform_repositories

<pre>
load("@rules_kubeconform//kubeconform:repositories.bzl", "kubeconform_repositories")

kubeconform_repositories(<a href="#kubeconform_repositories-name">name</a>, <a href="#kubeconform_repositories-kubeconform_version">kubeconform_version</a>, <a href="#kubeconform_repositories-platform">platform</a>, <a href="#kubeconform_repositories-repo_mapping">repo_mapping</a>)
</pre>

TODO

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="kubeconform_repositories-name"></a>name |  A unique name for this repository.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="kubeconform_repositories-kubeconform_version"></a>kubeconform_version |  -   | String | required |  |
| <a id="kubeconform_repositories-platform"></a>platform |  -   | String | required |  |
| <a id="kubeconform_repositories-repo_mapping"></a>repo_mapping |  In `WORKSPACE` context only: a dictionary from local repository name to global repository name. This allows controls over workspace dependency resolution for dependencies of this repository.<br><br>For example, an entry `"@foo": "@bar"` declares that, for any time this repository depends on `@foo` (such as a dependency on `@foo//some:target`, it should actually resolve that dependency within globally-declared `@bar` (`@bar//some:target`).<br><br>This attribute is _not_ supported in `MODULE.bazel` context (when invoking a repository rule inside a module extension's implementation function).   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  |


