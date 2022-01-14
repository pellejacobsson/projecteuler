### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 8c8c63a0-4a97-11eb-2a72-71fd652838f4
using Combinatorics

# ╔═╡ 58da90b2-4a9a-11eb-19a1-d52a7fdb8e30
c = 1:7

# ╔═╡ a1230d20-4a9a-11eb-1ac3-3b374176e702
a = collect(combinations(c, 2))

# ╔═╡ 6bb47ac0-4ab8-11eb-2cc7-572a8d3c3a23
b = collect(combinations(c, 3))

# ╔═╡ be3cd360-4ab7-11eb-24d0-7b1220e709b7
[x for x in a if x[2] - x[1] > 2]

# ╔═╡ 93cd1bb2-4ab9-11eb-3b2a-b38a326e1539
sum([binomial(sum(diff(x)), 2) for x in a])

# ╔═╡ f8854c70-4aba-11eb-27ce-4f2c3281cde7
sum([binomial(sum(diff(x)), 3) for x in b])

# ╔═╡ f594a4c0-4c31-11eb-1ea5-4b7a49be144f
binomial(7, 2) * binomial(5, 2)/2/3 + binomial(7, 3) * binomial(4, 3)/2/2

# ╔═╡ 675d9a10-4c34-11eb-2914-19bc8adf50eb
md"### Lösning från mathblog.dk
Fuskar lite...

Catalan-nummer:
\\[
C_n = \frac{1}{n + 1} {2n \choose n}
\\]
"

# ╔═╡ 9b007180-4c34-11eb-3906-e7f4f4f0e079
function ways(n, s)::Int
	return 1/2 * binomial(n, s) * binomial(n - s, s) - catalannum(s) * binomial(n, 2*s)
end

# ╔═╡ 0ffbf3fe-4c35-11eb-153b-01df67c1b9d7
sum([ways(12, s) for s in 2:6])

# ╔═╡ Cell order:
# ╠═8c8c63a0-4a97-11eb-2a72-71fd652838f4
# ╠═58da90b2-4a9a-11eb-19a1-d52a7fdb8e30
# ╠═a1230d20-4a9a-11eb-1ac3-3b374176e702
# ╠═6bb47ac0-4ab8-11eb-2cc7-572a8d3c3a23
# ╠═be3cd360-4ab7-11eb-24d0-7b1220e709b7
# ╠═93cd1bb2-4ab9-11eb-3b2a-b38a326e1539
# ╠═f8854c70-4aba-11eb-27ce-4f2c3281cde7
# ╠═f594a4c0-4c31-11eb-1ea5-4b7a49be144f
# ╟─675d9a10-4c34-11eb-2914-19bc8adf50eb
# ╠═9b007180-4c34-11eb-3906-e7f4f4f0e079
# ╠═0ffbf3fe-4c35-11eb-153b-01df67c1b9d7
