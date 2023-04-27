### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 55d6f209-77dd-42b2-9b04-cec23c678217
using Distributed

# ╔═╡ d7795a36-b1cd-11ed-12e8-210a8bca4b85
md"""
# First steps with Jolin Workspace.
"""

# ╔═╡ 3133be06-db22-4434-96b9-e99bdea7ba3e
1 + 1

# ╔═╡ a5431bac-19cf-489c-8aee-fd907c6518b7
Distributed.procs()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributed = "8ba89e20-285c-5b6f-9357-94700520ee1b"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "152fce1ab6b089528cb413b9e0e881b7fcb3a924"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
"""

# ╔═╡ Cell order:
# ╠═d7795a36-b1cd-11ed-12e8-210a8bca4b85
# ╠═3133be06-db22-4434-96b9-e99bdea7ba3e
# ╠═55d6f209-77dd-42b2-9b04-cec23c678217
# ╠═a5431bac-19cf-489c-8aee-fd907c6518b7
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
