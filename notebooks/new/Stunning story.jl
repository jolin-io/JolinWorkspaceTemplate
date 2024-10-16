### A Pluto.jl notebook ###
# v0.19.42

using Markdown
using InteractiveUtils

# ╔═╡ cd964a8e-8551-11ef-2446-cb0043002a0b
# please create a nice example

# ╔═╡ 2fec08c2-8552-11ef-16e7-cb8decffc3e7
jl.MD("""
Certainly! Here's an example of a Jupyter notebook using Python with some sample data, data processing, and visualizations. Let's create an example where we generate random data, process it, and then visualize it using a scatter plot.

### Imports
""")

# ╔═╡ 2ff93b3c-8552-11ef-11a0-21e93511b1a5
# begin
# 	import numpy as np
# 	import pandas as pd
# 	import matplotlib.pyplot as plt
# end

# ╔═╡ 3453c484-8552-11ef-06fc-ad9c5c1cbbd9
# Import necessary libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ╔═╡ 3453c544-8552-11ef-057e-fd5f7f7f1bcd
# Import necessary libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ╔═╡ 3453ce90-8552-11ef-3563-5954b7f1ce85
# Create example data
np.random.seed(42)
dates = pd.date_range('20230101', periods=100)
data = pd.DataFrame(np.random.randn(100, 4), index=dates, columns=list('ABCD'))

# ╔═╡ 3453d764-8552-11ef-11e5-85fb0d8d0edb
# Data processing
data['A_squared'] = data['A'] ** 2
data['C_rolling_mean'] = data['C'].rolling(window=10).mean()

# ╔═╡ 3453e350-8552-11ef-2855-b95c9e1c0e33
# Data visualization
plt.figure(figsize=(12, 6))

# Plotting column A
plt.subplot(2, 1, 1)
plt.plot(data['A'], color='b')
plt.title('Column A')

# Plotting rolling mean of column C
plt.subplot(2, 1, 2)
plt.plot(data['C_rolling_mean'], color='r')
plt.title('Rolling Mean of Column C')

plt.tight_layout()
plt.show()

# ╔═╡ 2ffa171e-8552-11ef-1426-098c27372afe
# begin
# 	import numpy as np
# 	import pandas as pd
# 	import matplotlib.pyplot as plt
# end

# ╔═╡ 34e3ba5a-8552-11ef-3c33-e3cb8f9c725c
# Import necessary libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ╔═╡ 34e3bae6-8552-11ef-16ef-bf2c47320502
# Import necessary libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ╔═╡ 2ffa17e6-8552-11ef-009f-bb017cac61b5
jl.MD("""
### Example Data
""")

# ╔═╡ 2ffa24aa-8552-11ef-35ac-5d81074e9d68
begin
	# Generating random data
	np.random.seed(42)
	num_points = 100
	x = np.random.rand(num_points)
	y = 2*x + np.random.normal(0, 0.2, num_points)
end

# ╔═╡ 2ffa24f2-8552-11ef-1d74-71ab3bd1592d
jl.MD("""
### Data Processing
""")

# ╔═╡ 2ffa2970-8552-11ef-1235-c7b537b8e44c
# Creating a DataFrame
data = pd.DataFrame({'X': x, 'Y': y})

# ╔═╡ 3453cf08-8552-11ef-067a-d3b9f5ed7b18
# Display the first few rows of the generated data
data.head()

# ╔═╡ 3453d7d2-8552-11ef-12f6-873f014440af
# Check the modified data
data.head()

# ╔═╡ 2ffa29a2-8552-11ef-109e-a5052f1708e4
# Data summary
data.head()

# ╔═╡ 2ffa29ca-8552-11ef-36f9-f76989955b70
jl.MD("""
### Visualization
""")

# ╔═╡ 2ffa2dbe-8552-11ef-372d-85838bcbeb5d
# Plotting the data
plt.figure(figsize=(10, 6))
plt.scatter(data['X'], data['Y'], color='skyblue', label='Data points')
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Scatter Plot of Random Data')
plt.legend()
plt.grid(True)
plt.show()

# ╔═╡ 2ffa2df0-8552-11ef-0d2a-e9a721e383b6
jl.MD("""
In a Jupyter notebook, you can run these code blocks sequentially to see the generated plot at the end. This example generates random data points, processes it with pandas, and visualizes it using matplotlib in a scatter plot.
""")

# ╔═╡ Cell order:
# ╠═cd964a8e-8551-11ef-2446-cb0043002a0b
# ╟─2fec08c2-8552-11ef-16e7-cb8decffc3e7
# ╠═2ff93b3c-8552-11ef-11a0-21e93511b1a5
# ╠═3453c484-8552-11ef-06fc-ad9c5c1cbbd9
# ╠═3453c544-8552-11ef-057e-fd5f7f7f1bcd
# ╠═3453ce90-8552-11ef-3563-5954b7f1ce85
# ╠═3453cf08-8552-11ef-067a-d3b9f5ed7b18
# ╠═3453d764-8552-11ef-11e5-85fb0d8d0edb
# ╠═3453d7d2-8552-11ef-12f6-873f014440af
# ╠═3453e350-8552-11ef-2855-b95c9e1c0e33
# ╠═2ffa171e-8552-11ef-1426-098c27372afe
# ╠═34e3ba5a-8552-11ef-3c33-e3cb8f9c725c
# ╠═34e3bae6-8552-11ef-16ef-bf2c47320502
# ╟─2ffa17e6-8552-11ef-009f-bb017cac61b5
# ╠═2ffa24aa-8552-11ef-35ac-5d81074e9d68
# ╟─2ffa24f2-8552-11ef-1d74-71ab3bd1592d
# ╠═2ffa2970-8552-11ef-1235-c7b537b8e44c
# ╠═2ffa29a2-8552-11ef-109e-a5052f1708e4
# ╟─2ffa29ca-8552-11ef-36f9-f76989955b70
# ╠═2ffa2dbe-8552-11ef-372d-85838bcbeb5d
# ╟─2ffa2df0-8552-11ef-0d2a-e9a721e383b6
