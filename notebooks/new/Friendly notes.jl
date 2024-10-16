### A Pluto.jl notebook ###
# v0.19.42

using Markdown
using InteractiveUtils

# ╔═╡ 7cf56110-856e-11ef-0bf5-39ad35c7e972
# Generate example data
using Random

# ╔═╡ 77f1eed6-856e-11ef-07d2-e12addadeb58
md"""
# Welcome Julia
"""

# ╔═╡ 77f1ef4c-856e-11ef-1fe9-dbcbfc668531
# using Jolin

# ╔═╡ 7cdf73fa-856e-11ef-2f51-754a9e55ee0d
jl.MD("""
It seems like you meant to import packages in Julia for your Jupyter notebook. Here is an example of how you can import packages in Julia using the `using` keyword:
""")

# ╔═╡ 7cf46508-856e-11ef-2f71-67260c2817fc
using DataFrames
using CSV
using Plots
using Statistics

# ╔═╡ 7cf547e6-856e-11ef-3ca5-a5e6037826bb
jl.MD("""
Next, let's create an example dataset and perform some data processing on it. We will generate some random data for this example.
""")

# ╔═╡ 7cf56176-856e-11ef-2b6b-a3c25de1128c
Random.seed!(123)  # Setting a seed for reproducibility
n = 100
x = rand(1:100, n)
y = 2x .+ randn(n)  # y = 2x + noise

# ╔═╡ 7cf561a8-856e-11ef-0d91-eb7571f5d539
data = DataFrame(x=x, y=y)
first(data, 5)  # Displaying the first 5 rows of the generated data

# ╔═╡ 7cf56200-856e-11ef-2dde-2d16a769fa2e
jl.MD("""
Now, let's perform some basic data processing tasks like calculating the mean and standard deviation of the `x` and `y` columns in the dataset.
""")

# ╔═╡ 7cf5766e-856e-11ef-3afa-f7e739d57695
# Data processing
x_mean = mean(data.x)
y_mean = mean(data.y)
x_std = std(data.x)
y_std = std(data.y)

# ╔═╡ 7cf576b4-856e-11ef-0501-b957c740677f
println("Mean of x: $x_mean, Standard Deviation of x: $x_std")
println("Mean of y: $y_mean, Standard Deviation of y: $y_std")

# ╔═╡ 7cf5770e-856e-11ef-26aa-dd8713504264
jl.MD("""
Finally, let's create a visualization of the data using a scatter plot to show the relationship between `x` and `y`.
""")

# ╔═╡ 7cf580b4-856e-11ef-3d7f-47ecb13e42c0
# Visualization
plot(data.x, data.y, seriestype = :scatter, xlabel = "X", ylabel = "Y", title = "Scatter plot of X vs Y")

# ╔═╡ 7cf580fa-856e-11ef-2d1a-a38e56f1277f
jl.MD("""
Feel free to run these code blocks in a Julia Jupyter notebook to see the output and visualization. Let me know if you need any further assistance!
""")

# ╔═╡ 77f1ef6c-856e-11ef-36e0-e1cc4775c783


# ╔═╡ Cell order:
# ╠═77f1eed6-856e-11ef-07d2-e12addadeb58
# ╠═77f1ef4c-856e-11ef-1fe9-dbcbfc668531
# ╟─7cdf73fa-856e-11ef-2f51-754a9e55ee0d
# ╠═7cf46508-856e-11ef-2f71-67260c2817fc
# ╟─7cf547e6-856e-11ef-3ca5-a5e6037826bb
# ╠═7cf56110-856e-11ef-0bf5-39ad35c7e972
# ╠═7cf56176-856e-11ef-2b6b-a3c25de1128c
# ╠═7cf561a8-856e-11ef-0d91-eb7571f5d539
# ╟─7cf56200-856e-11ef-2dde-2d16a769fa2e
# ╠═7cf5766e-856e-11ef-3afa-f7e739d57695
# ╠═7cf576b4-856e-11ef-0501-b957c740677f
# ╟─7cf5770e-856e-11ef-26aa-dd8713504264
# ╠═7cf580b4-856e-11ef-3d7f-47ecb13e42c0
# ╟─7cf580fa-856e-11ef-2d1a-a38e56f1277f
# ╠═77f1ef6c-856e-11ef-36e0-e1cc4775c783
