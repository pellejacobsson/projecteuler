### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ fdaeb5d0-4932-11eb-38b3-797df89772a4
using Combinatorics

# ╔═╡ ff16f860-4932-11eb-3bc7-7f9f931432af
html"""<style>
main {
    max-width: 1000px;
}
"""

# ╔═╡ 55fab150-4931-11eb-3806-db3bc82ca003
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

# ╔═╡ 2fdbd5d0-4936-11eb-156c-af93cab27755
function minsumset(n, nmin, nmax)
	s = nmax*n
	minset = []
	for set in combinations(nmin:nmax, n)
		if isspecialsumset(set)
			if sum(set) < s
				s = sum(set)
				minset = set
			end
		end
	end
	return minset
end

# ╔═╡ 58e32710-4938-11eb-1e79-798cdeb3f6e6
minsumset(7, 20, 45)

# ╔═╡ Cell order:
# ╠═ff16f860-4932-11eb-3bc7-7f9f931432af
# ╠═fdaeb5d0-4932-11eb-38b3-797df89772a4
# ╠═55fab150-4931-11eb-3806-db3bc82ca003
# ╠═2fdbd5d0-4936-11eb-156c-af93cab27755
# ╠═58e32710-4938-11eb-1e79-798cdeb3f6e6
