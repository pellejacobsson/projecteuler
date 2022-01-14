### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ e793c5b0-4a81-11eb-2b9a-539413d1c45c
using Combinatorics

# ╔═╡ 45870cfe-4a80-11eb-1972-21baf3749cb5
input = open("p105_sets.txt") do f
	readlines(f)
end

# ╔═╡ 117048a0-4a81-11eb-036c-1720e79e485f
begin
sets = Array{Array{Int, 1}, 1}()
for line in input
	push!(sets, [parse(Int, x) for x in split(line, ",")])
end
end

# ╔═╡ 4e4196d0-4a81-11eb-3b18-5df439b33796
function isspecialsumset(a)
	rval = true
	nn = Int(floor(length(a)/2))
	mm = length(a) - nn
	for n = 1:nn
		for m = 1:mm
			for b in combinations(a, n)
				left = setdiff(a, b)
				for c in combinations(left, m)
					if sum(b) == sum(c)
						rval = false
					elseif ((length(c) > length(b)) & (sum(c) ≤ sum(b))) | ((length(b) > length(c)) & (sum(b) ≤ sum(c)))
						rval = false
					end
				end
			end
		end
	end
	return rval
end

# ╔═╡ de78d6f0-4a81-11eb-29c3-a3afa8414727
s = [sum(x) for x in sets if isspecialsumset(x)]

# ╔═╡ 8038c4a0-4a82-11eb-1d97-4fa068802504
sum(s)

# ╔═╡ Cell order:
# ╠═e793c5b0-4a81-11eb-2b9a-539413d1c45c
# ╠═45870cfe-4a80-11eb-1972-21baf3749cb5
# ╠═117048a0-4a81-11eb-036c-1720e79e485f
# ╠═4e4196d0-4a81-11eb-3b18-5df439b33796
# ╠═de78d6f0-4a81-11eb-29c3-a3afa8414727
# ╠═8038c4a0-4a82-11eb-1d97-4fa068802504
